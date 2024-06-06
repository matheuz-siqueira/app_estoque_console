class ProdutoServico #unit of work
  @arquivo = "db/produtos.json"

  def initialize(repositorio, arquivo)
    @repositorio = repositorio
    @arquivo = arquivo
  end

  def todos
    dados = @repositorio.ler(@arquivo)
    produtos = []
    dados.each do |dado|
      produtos << Produto.new(dado)
    end

    produtos
  end

  def adicionar(produto)
    produto_hash = self.transformar_para_hash(produto)
    require 'byebug'
    byebug
    @repositorio.adicionar(@arquivo, produto_hash)
  end

  def atualizar(produto)
    dados = @repositorio.ler(@arquivo)
    produto_hash = dados.find{|dado| dado["id"] == produto.id}
    produto_hash["nome"] = produto.nome
    produto_hash["descricao"] = produto.descricao
    produto_hash["preco"] = produto.preco
    produto_hash["quantidade"] = produto.quantidade

    @repositorio.gravar(@arquivo, dados)
  end

  private
  def transformar_para_hash(produto)
    produto.instance_variables.each_with_object({}) do |var, hash|
        hash[var.to_s.delete("@")] = produto.instance_variable_get(var)
      end
    end
end