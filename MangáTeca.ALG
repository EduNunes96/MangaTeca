algoritmo "Sistema de gest�o de uma Mang�teca"
// Disciplina  :  [L�gica de Programa��o]
// Professora   : Fabr�cia Py Noronha
// Fun��oo : Sistema que gera a MangaTeca
// Autor : Eduardo Nunes
// Data : 29/03/2025
// Sec��o de Declara��es

// emprestar livros
tipo informacao = registro
   // informa��es do livro
   titulo: caractere
   genero: caractere
   autor: caractere
   codigo: inteiro
   disponivel: logico

   // Vari�veis do cliente
   nomeCliente: caractere
   codigoCliente: inteiro

fimregistro
// 1
// mostrar a lista de livros com o genero e o autor e se o livro est� dispon�vel ou n�o
// de livros
procedimento MostrarLivros
var
   i: inteiro

inicio
   // loop para mostrar apenas livros que existem na lista
   escreval("| Autor(a)     |    T�tulo    | G�nero |   Est� Dispon�vel ? |")
   para i de 1 ate contador faca
      se(lista_de_livros[i].titulo <> "") entao
         escreva(" ", lista_de_livros[i].autor, " |")
         escreva(" ",lista_de_livros[i].titulo, "    |")
         escreva(" ",lista_de_livros[i].genero, "   |")



         // se a disponibilidade do livro for igual a verdadeiro, est� disponivel
         // caso n�o, n�o est�
         se (lista_de_livros[i].disponivel = verdadeiro) entao
            // escrever a quantidade e se o livro est� disponivel
            escreval(" Sim |")
         senao
            // escrever a disponibilidade e se o livro n�o estiver disponivel, � falso
            lista_de_livros[i].disponivel <- falso
            escreval(" N�o | ")
         fimse
      fimse
   fimpara

fimprocedimento
// 2
// adicionar livros novos

procedimento AdicionarLivros
var
   i: inteiro
inicio
   //atribui��o do �ndice
   i <- 1
   enquanto i <> -1 faca
      se lista_de_livros[i].titulo <> "" entao
         i <- i + 1
      senao
         escreval("Insira o t�tulo do livro ou mang�: ")
         leia(lista_de_livros[i].titulo)

         escreval("Adicione o autor ou autora: ")
         leia(lista_de_livros[i].autor)

         escreval("Adicione o g�nero: ")
         leia(lista_de_livros[i].genero)
         // atribui��o que adiciona um livro a lista
         lista_de_livros[i].disponivel <- verdadeiro
         i <- -1
      fimse
   fimenquanto
fimprocedimento



// 3
// emprestar livros
procedimento EmprestarLivro

var
   titulo, nomeCliente: caractere
   ICliente, ILivro: inteiro
   i: inteiro
   LivroDisponivel: logico

inicio
   MostrarLivros
   ListaClientes
   //Adapta��o para melhorar a busca pelo livro ou mang�
   escreva("Livro ou Mang� que deseja emprestar: ")
   leia(titulo)

   ILivro <- BuscaLivros(titulo)
   Se (ILivro = -1) entao
      Escreval("O Livro n�o foi encontrado")
   Fimse
   escreva("Nome do cliente: ")
   leia(nomeCliente)
   ICliente <- BuscaCliente(nomeCliente)
   Se (ICliente = -1) ou (ILivro = -1) entao
   Senao
      se (lista_de_livros[ILivro].disponivel = falso) entao
         escreval("O livro",titulo ," est� indispon�vel")
      Senao
         i <- 1
      Enquanto i <> - 1 faca
         Se (lista_de_emprestimo[i].titulo <> "") entao
            i <- i + 1
         Senao
            lista_de_emprestimo[i].titulo <- titulo
            lista_de_emprestimo[i].nomeCliente <- nomeCliente
            limpatela()
            Escreval("O Cliente ", nomeCliente," retirou o livro ",titulo)
            i <- - 1
         Fimse
      Fimenquanto
   Fimse
Fimse


//Se e sen�o para determinar se o livro e o cliente foram encontrados



fimprocedimento

// 4
// mostrar os livros emprestados e as pessoas que os emprestaram
procedimento LivrosEmprestados

var
   i: inteiro
   nomeCliente: caracter

inicio
   escreval("Nome: ", "| Livro: ")
   //la�o para contar quantos livros da lista foram emprestados ao todo
   para i de 1 ate contador faca
      se (lista_de_emprestimo[i].titulo <> "") entao
         escreval(lista_de_emprestimo[i].nomeCliente, "| |", lista_de_emprestimo[i].titulo)
      fimse

   fimpara
fimprocedimento

// 5
// registrar novos clientes
procedimento RegistrarCliente

var
   i: inteiro

inicio
   //atribui��o do ind�ce de Clientes <- 1
   i <- 1
   //la�o de repeti��o enquanto para o indice ser diferente de - 1
   enquanto i <> -1 faca
      se lista_de_cliente[i].nomeCliente <> "" entao
         //se (lista_de_cliente[i].nomeCliente <> "") entao
         i <- i + 1
      Senao
         escreva("Nome do cliente a registrar: ")
         leia(lista_de_cliente[i].nomeCliente)
         limpatela()
         i <- -1
         // verificar se o codigo do cliente j� existe
         // caso existir, gerar um outro
      fimse
   fimenquanto
fimprocedimento


Funcao BuscaCliente(NomeCliente: caractere): inteiro
var
   i: inteiro
   ICliente: inteiro
Inicio
   i <- 1
   ICliente <- - 1
   Enquanto (i <= contador) faca
      se (lista_de_cliente[i].nomeCliente = nomeCliente) entao
         escreval("Cliente encontrado")
         ICliente <- i
      Fimse
      i <- i + 1
   Fimenquanto
   Retorne ICliente
Fimfuncao

Funcao BuscaLivros(titulo: caractere): inteiro
var
   i: inteiro
   ILivros: inteiro
Inicio
   i <- 1
   ILivros <- - 1
   Enquanto (i <= contador) faca
      se (lista_de_livros[i].titulo = titulo) entao
         escreval("Livro encontrado")
         ILivros <- i
      Fimse
      i <- i + 1
   Fimenquanto
   Retorne ILivros
Fimfuncao


// 6
// imprimir a lista de clientes e os seus codigos
procedimento ListaClientes
//nomeCliente: caractere
//codigoCliente: inteiro
var
   i: inteiro
inicio
   escreval("Lista de clientes: ")
   escreval("Nome: ")
   //la�o para contar o n�mero de clientes atrav�s do registro de nomes, armazenando eles depois de contar
   para i de 1 ate contador faca
      se (lista_de_cliente[i].nomeCliente <> "") entao
         escreval(lista_de_cliente[i].nomeCliente)
      fimse
   fimpara
fimprocedimento

// 7
// fazer a devolu��o dos livros emprestados
// e eliminar eles da lista de emprestimo
procedimento DevolverLivro
var
   j, i: inteiro
   titulo: caractere
inicio
   escreval("Devolver os livros")
   LivrosEmprestados
   escreva("Titulo do livro ou mang� que deseja devolver: ")
   leia(titulo)
   para i de 1 ate contador faca
      //la�o para mostrar os livros emprestados e comparar se os nomes est�o certos
      se (lista_de_emprestimo[i].titulo = titulo) entao
         para j de 1 ate contador faca
            se (lista_de_livros[j].titulo = titulo) entao
               lista_de_livros[j].disponivel <- verdadeiro
               lista_de_emprestimo[i].titulo <- ""
               lista_de_emprestimo[i].nomeCliente <- ""
               limpatela()
               escreval("O livro ou mang� ", titulo, " foi devolvido")
            fimse
         fimpara
      fimse

   fimpara


fimprocedimento

// Algoritmo principal
var
   lista_de_emprestimo: vetor[1..10] de informacao
   lista_de_livros: vetor[1..10] de informacao
   lista_de_cliente: vetor[1..10] de informacao
   funcionar: logico
   cliente_nome: caractere
   livro: caractere
   //adicionar: caractere
   contador: inteiro
   opcao: inteiro


   // inicio do programa
inicio
   contador <- 10

   // clientes
   lista_de_cliente[1].nomeCliente <- "Eduardo"
   lista_de_cliente[1].codigoCliente <- 12
   // alguns livros com as suas informa��es
   lista_de_livros[1].titulo <- "Beastars"
   lista_de_livros[1].genero <- "Drama"
   lista_de_livros[1].disponivel <- verdadeiro
   //Autores ou autoras das obras
   lista_de_livros[1].autor <- "Paru Itagaki"
   lista_de_livros[1].codigo <- 1
   // alguns livros com as suas informa��es
   lista_de_livros[2].titulo <- "Pok�mon Platinum"
   lista_de_livros[2].genero <- "Shounen"
    //Autores ou autoras das obras
   lista_de_livros[2].autor <- "Satoshi Yamamoto"
   lista_de_livros[2].codigo <- 2
   lista_de_livros[2].disponivel <- verdadeiro
   funcionar <- verdadeiro

   // clientes
   lista_de_cliente[2].nomeCliente <- "Leandro"
   lista_de_cliente[2].codigoCliente <- 13



   //Tela inicial em Ascii
mudaCor("amarelo","frente")
escreval("db      d888888b db    db d8888b.  .d88b.")
escreval("88        `88'   88    88 88  `8D .8P  Y8.")
escreval("88         88    Y8    8P 88oobY' 88    88")
escreval("88         88    `8b  d8' 88`8b   88    88")
escreval("88booo.   .88.    `8bd8'  88 `88. `8b  d8'")
escreval("Y88888P Y888888P    YP    88   YD  `Y88P'")


escreval("d888888b d88888b  .o88b.  .d8b.")
escreval("`~~88~~' 88'     d8P  Y8 d8' `8b")
escreval("   88    88ooooo 8P      88ooo88")
escreval("   88    88~~~~~ 8b      88~~~88")
escreval("   88    88.     Y8b  d8 88   88")
escreval("   YP    Y88888P  `Y88P' YP   YP")


escreval(".88b  d88.  .d8b.  d8b   db  d888b   .d8b.")
escreval("88'YbdP`88 d8' `8b 888o  88 88' Y8b d8' `8b")
escreval("88  88  88 88ooo88 88V8o 88 88      88ooo88")
escreval("88  88  88 88~~~88 88 V8o88 88  ooo 88~~~88")
escreval("88  88  88 88   88 88  V888 88. ~8~ 88   88")
escreval("YP  YP  YP YP   YP VP   V8P  Y888P  YP   YP")
limpatela()

escreval("========================")
escreval("=====SEJA BEM-VINDO=====")
escreval("====LIVROTECA MANG�====")
escreval("========================")
escreval("Veja as nossas op��es:")
escreval("========================")
repita
   //lista de op��es
   escreval()
   escreval("1 Mostrar livros")
   escreval("2 Adicionar livros")
   escreval("3 Emprestar livros")
   escreval("4 Mostrar livros emprestados")
   escreval("5 Registrar cliente")
   escreval("6 Lista de clientes")
   escreval("7 Devolver livros")
   escreval("8 Fechar o sistema")
   escreva("Qual opc�o voc� deseja escolher?: ")
   leia(opcao)
   escolha(opcao)
   caso 1
      MostrarLivros
   caso 2
      AdicionarLivros
   caso 3
      EmprestarLivro
   caso 4
      LivrosEmprestados
   caso 5
      RegistrarCliente
   caso 6
      ListaClientes
   caso 7
      DevolverLivro
   caso 8
      interrompa
   fimescolha

ate funcionar = falso

fimalgoritmo