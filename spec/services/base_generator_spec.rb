# frozen_string_literal: true

require 'rails_helper'

class TempClass < BaseGenerator
  def call
    yield xml_data

    Success(:protobuf_data)
  end
end

RSpec.describe BaseGenerator, type: :service do
  subject { TempClass.call(file_path: file_path) }

  let(:file_path) { 'spec/fixtures/files/valid.xml' }

  describe '#call' do
    context 'when receives valid xml file' do
      it { is_expected.to be_success }

      it 'returns correct result for the valid file' do
        expect(subject.value!).to eq(:protobuf_data)
      end
    end

    context 'when receives invalid file path' do
      let(:file_path) { 'spec/fixtures/files/invalid_path' }

      it { is_expected.to be_failure }
      it { expect(subject.failure).to eq(:invalid_file) }
    end
  end
end
