module Smartcsv
  class Parser
    def self.read(file)
      CSV.read(file,{encoding: get_encoding(file), col_sep: get_separator(file)})
    end

    def self.get_encoding(file)
      @encoding ||= File.read(file).encoding.name
    end

    def self.get_separator(file)
      line = IO.readlines(file, encoding: get_encoding(file))[0]

      h = {}
      h["comma"] = line.split(',').count
      h["semicolon"] = line.split(';').count
      h["tab"] = line.split("\t").count

      case h.max{|a,b| a[1] <=> b[1]}[0]
      when "semicolon" then ';'
      when "tab" then "\t"
      else ','
      end
    end
  end
end
