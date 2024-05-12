def cadastrar_produto(produtos)
  mensagem("Iniciando cadastro de produto...", true, true, 1)
  mensagem("Digite o nome do produto: ", false, false)
  nome = gets.chomp.to_s
  limpar_tela
  mensagem("Digite a descrição do produto #{verde(nome)}: ", false, false)
  descricao = gets.chomp.to_s
  limpar_tela
  mensagem("Digite o preço do produto #{verde(nome)}: ", false, false)
  preco = gets.to_f
  limpar_tela
  mensagem("Digite a quantidade em estoque do produto #{verde(nome)}: ", false, false)
  quantidade = gets.to_i

  last = produtos.last
  last_id = last[:id]

  produtos << {
    id: last_id + 1,
    nome: nome,
    descricao: descricao,
    preco: preco,
    quantidade: quantidade
  }

  mensagem_verde("O produto #{amarelo(nome)} foi cadastrado com sucesso!", true, true, 3)
end