# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GeneratePlacementSeq, type: :service do
  subject { described_class.call(file_path: file_path) }

  let(:file_path) { 'spec/fixtures/files/valid.xml' }

  describe '#call' do
    context 'when receives valid xml file' do
      it { is_expected.to be_success }

      it 'returns correct result for the valid file' do
        # rubocop:disable Layout/LineLength
        expected_protobuf = "\nI\n\x05plc-1\x12\x0E\n\aVideo-1\x15I\x9D\xCE@\x12\x0E\n\aVideo-7\x15\xB0@\rD\x12\x0F\n\bVideo-12\x15R\xA7\x83A\x12\x0F\n\bVideo-25\x15\xC9v)A\n\x17\n\x05plc-2\x12\x0E\n\aVideo-7\x15\xB0@\rD\n9\n\x05plc-3\x12\x0E\n\aVideo-7\x15\xB0@\rD\x12\x0F\n\bVideo-12\x15R\xA7\x83A\x12\x0F\n\bVideo-25\x15\xC9v)A\n\x17\n\x05plc-4\x12\x0E\n\aVideo-7\x15\xB0@\rD\n\x17\n\x05plc-5\x12\x0E\n\aVideo-7\x15\xB0@\rD\n\x17\n\x05plc-6\x12\x0E\n\aVideo-7\x15\xB0@\rD\nY\n\x05plc-7\x12\x0E\n\aVideo-1\x15I\x9D\xCE@\x12\x0E\n\aVideo-4\x15\x06\r\xA1?\x12\x0E\n\aVideo-7\x15\xB0@\rD\x12\x0F\n\bVideo-12\x15R\xA7\x83A\x12\x0F\n\bVideo-25\x15\xC9v)A\nI\n\x05plc-8\x12\x0E\n\aVideo-1\x15I\x9D\xCE@\x12\x0E\n\aVideo-7\x15\xB0@\rD\x12\x0F\n\bVideo-12\x15R\xA7\x83A\x12\x0F\n\bVideo-25\x15\xC9v)A"
        # rubocop:enable Layout/LineLength

        expect(subject.value!.force_encoding('UTF-8')).to eq(expected_protobuf)
      end
    end

    context 'when receives invalid file path' do
      let(:file_path) { 'spec/fixtures/files/invalid_path' }

      it { is_expected.to be_failure }
      it { expect(subject.failure).to eq(:invalid_file) }
    end
  end
end
