require_relative 'display/menu'
require_relative 'display/operacoes_de_tela'
require_relative 'core/cadastrar_produto'
require_relative 'core/listar_produtos'
require_relative 'core/retirar_estoque'

produtos = [
  {
    id: 1,
    nome: "Mouse",
    descricacao: "Mouse gamer sem fio",
    preco: 60.2,
    quantidade: 10,
  },
  {
    id: 2,
    nome: "Suporte notebook",
    descricacao: "Suporte de notebook ideal para escritório",
    preco: 70.9,
    quantidade: 12,
  },
  {
    id: 3,
    nome: "Monitor",
    descricacao: "Monitor vertical Dell",
    preco: 120.20,
    quantidade: 6,
  }
]
iniciar_menu(produtos)