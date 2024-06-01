require 'json'

class JsonRepositorio
  def self.ler(arquivo)
    unless File.exist?(arquivo)
      puts "O arquivo #{arquivo} não existe"
      nil
    end

    begin
      json_data = File.read(arquivo)
      data = JSON.parse(json_data)
      data
    rescue JSON::ParserError => e
      puts "Erro ao analisar o arquivo json #{e}"
      nil
    end
  end

  def self.adicionar(arquivo, obj)
    data = ler(arquivo) || []
    data << obj

    self.gravar(arquivo, data)
  end

  def self.gravar(arquivo, array)
    File.open(arquivo, 'w') do |file|
      file.puts JSON.pretty_generate(array)
    end
  end
end