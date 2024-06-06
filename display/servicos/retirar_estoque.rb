require 'terminal-table'

def retirar_estoque
  limpar_tela
  mensagem_amarelo("====== Escolha um dos produtos abaixo ======", false, false)

  table = Terminal::Table.new do |t|
    t.headings = ['ID', 'Nome', 'Quantidade']
    ProdutoServico.new(JsonRepositorio, "db/produtos.json").todos.each do |produto|
      t.add_row [produto.id, produto.nome, produto.quantidade]
    end
  end

  puts table
  mensagem_azul("Digite o ID do produto", false, false)
  id = gets.to_i

  produto = ProdutoServico.new(JsonRepositorio, "db/produtos.json").todos.find{|p| p.id == id}

  unless produto
    mensagem_vermelho("Produto do id #{id} não encontrado!", true, true, 3)
    mensagem_amarelo("Deseja digitar o id novamente? [s/n]", false, false)
    option = gets.chomp
    if option != 's' || option != 'S'
      limpar_tela
    else
      retirar_estoque
    end
  else
    mensagem_azul("Qual a total de itens que serão retirados do estoque do produto #{amarelo(produto.nome)}", false, false)
    mensagem_verde("Quantidade atual: #{amarelo(produto.quantidade)}", false, false )
    quantidade_retirada = gets.to_i

    if produto.quantidade >= quantidade_retirada
      produto.quantidade -= quantidade_retirada
      mensagem_verde("Retirada realizada com sucesso", true, true, 3)
      ProdutoServico.new(JsonRepositorio, "db/produtos.json").atualizar(produto)

      listar_produtos
    else
      mensagem_vermelho("O valor de retirada informado é maior que o valor presente me estoque!")
      mensagem_vermelho("Não foi possível atualizar o estoque!")
      listar_produtos
    end


  end
end