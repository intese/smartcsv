# encoding: utf-8
require 'spec_helper'

describe Smartcsv do
  describe "read an exemple csv file" do

    let(:content) do
      FileUtils.mkdir_p './tmp'
      file = './tmp/example.csv'
      encode_string = encode == 'UTF-8' ? '' : ":UTF-8:#{encode}"
      CSV.open(file, "wb#{encode_string}", col_sep: col_sep) do |csv|
        csv << ['Dürüm', 'Kebab', 'Тест']
        csv << ['Dürüm', 'Kebab', 'Тест']
      end
      file
    end

    context "encoded as ISO-8859-1" do
      let(:encode) {'ISO-8859-1'}

      context "with semicolon as column separator" do
        let(:col_sep) {';'}
        it { Smartcsv.read(content).first[0].should eq "Dürüm" }
      end

      context "with comma as column separator" do
        let(:col_sep) {','}
        it { Smartcsv.read(content).first[0].should eq "Dürüm" }
      end

      context "with tab as column separator" do
        let(:col_sep) {"\t"}
        it { Smartcsv.read(content).first[0].should eq "Dürüm" }
      end
    end

    context "encoded as UTF-8" do
      let(:encode) {'UTF-8'}

      context "with semicolon as column separator" do
        let(:col_sep) {';'}
        it { Smartcsv.read(content).first[0].should eq "Dürüm" }
      end

      context "with comma as column separator" do
        let(:col_sep) {','}
        it { Smartcsv.read(content).first[0].should eq "Dürüm" }
      end

      context "with tab as column separator" do
        let(:col_sep) {"\t"}
        it { Smartcsv.read(content).first[0].should eq "Dürüm" }
      end

    end

  end
end
