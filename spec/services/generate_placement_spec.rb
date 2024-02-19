# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GeneratePlacement, type: :service do
  subject { described_class.call(file_path: file_path, placement_id: placement_id) }

  let(:file_path) { 'spec/fixtures/files/valid.xml' }

  describe '#call' do
    context 'when receives valid placement_id' do
      let(:placement_id) { 'plc-1' } # It comes from './spec/fixtures/files/valid.xml'

      it { is_expected.to be_success }

      it 'returns correct the placement in protobuf format' do
        # rubocop:disable Layout/LineLength
        expected_protobuf = "\n\u0005plc-1\u0012\u000E\n\aVideo-1\u0015I\x9D\xCE@\u0012\u000E\n\aVideo-7\u0015\xB0@\rD\u0012\u000F\n\bVideo-12\u0015R\xA7\x83A\u0012\u000F\n\bVideo-25\u0015\xC9v)A"
        # rubocop:enable Layout/LineLength

        expect(subject.value!.force_encoding('UTF-8')).to eq(expected_protobuf)
      end
    end

    context 'when receives invalid placement_id' do
      let(:placement_id) { 'invlaid-id' }

      it { is_expected.to be_failure }
      it { expect(subject.failure).to eq(:invalid_id) }
    end
  end
end
