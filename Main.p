program Cafeteria;
uses crt;
var
  comidas, bebidas: array[1..3] of String;
  comidasPrecos, bebidasPrecos: array[1..3] of Double; // Array de preços
  quantidade: array[1..100] of integer;
  i, respm, respc, respb, n, qtd, totalItens: Integer;
  pedido: array[1..100] of String;
  total: Double; // Variável para armazenar o preço total do pedido
  cliente: String;

  procedure LimparPedido;
  begin
    total := 0;
    i := 1;
    FillChar(pedido, SizeOf(pedido), 0); // Define a array pedido como vazia. 
  end;
begin
 ClrScr;

  // Defina os preços para comidas e bebidas
  comidasPrecos[1] := 10.0; // Preço do Bolo de Morango
  comidasPrecos[2] := 8.0;  // Preço do Pastel de Frango
  comidasPrecos[3] := 12.0; // Preço da Torta de Limão

  bebidasPrecos[1] := 3.0;  // Preço do Cafe Expresso
  bebidasPrecos[2] := 4.0;  // Preço do Suco Natural de Laranja
  bebidasPrecos[3] := 5.0;  // Preço do Milkshake de Chocolate

  // Inicialização de variáveis
  
  i := 1;
  respm := 0;
  respc := 0;
  respb := 0;
  totalItens := 0;

  Writeln('Seja bem-vindo a Cafeteria!');
  Write('Por favor, informe seu nome:');
  Readln (cliente);

   ClrScr;
  
  Writeln('Olá, ', cliente, '!');
  Writeln('----------------------------------------');

  repeat
    // Menu principal
    Writeln('Escolha o que fazer');
    Writeln('1- Ver Cardápio de Comidas');
    Writeln('2- Ver Cardápio de Bebidas');
    Writeln('3- Ver Pedido');
    Writeln('4- Finalizar Pedido');
    Writeln('5- Cancelar Pedido');
    Writeln('0- Sair do programa');
    Readln(respm);
    
    // Tratamento de excessão(caso usuário escolha algo diferente de 0 a 5)
    ClrScr;
    if (respm < 0) or (respm > 5 ) then
    begin
      Writeln('Escolha inválida. Por favor, escolha um número de 0 a 5.');
      continue; // Volta ao início do loop
    end;

    // Sequência de comandos caso o usuário escolha 1
    if respm = 1 then
    begin
     
      // Apresenta o cardápio de comidas
      Writeln('Cardápio de comidas');
      Writeln('1- Bolo de Morango - R$10.00');
      Writeln('2- Pastel de Frango - R$8.00');
      Writeln('3- Torta de Limão - R$12.00');
      Writeln('0- Voltar para o menu');
      Write('Escolha uma opção: ');
      Readln(respc);
      
     if respc = 0 then
      begin
      continue; // Volta ao início do loop
      end
      // Tratamento de excessão
      else if (respc < 0) or (respc > 3 ) then   
      begin
       Writeln('Escolha inválida. Por favor, escolha uma opção de 0 a 3.');
        continue; // Volta ao início do loop
      end;

      Writeln('Quantos deseja adicionar ao pedido? ');
      Readln(qtd);

      // Verifica qual alimento foi escolhido e adiciona ao array pedido
      case respc of
        1: pedido[i] := 'Bolo de Morango';
        2: pedido[i] := 'Pastel de Frango';
        3: pedido[i] := 'Torta de Limão';
      end;
        //quantidade de cada item pedido
      quantidade[i] := qtd;
       // total de itens pedidos
      totalItens := totalItens + qtd;
      // Cálculo do valor do pedido
      total := (total + comidasPrecos[respc]) * qtd;
      // Mensagem de adição do pedido
      Writeln('');
      Writeln('Pedido adicionado! Preço atual do pedido: R$', total:0:2);
      Writeln('----------------------------------------');
      i := i + 1;
    end;
      
    // Caso o usuário escolha 2 no menu
    
    if respm = 2 then
    begin
      // Cardápio de Bebidas
      Writeln('Cardápio de bebidas');
      Writeln('1- Cafe Expresso - R$3.00');
      Writeln('2- Suco Natural de Laranja - R$4.00');
      Writeln('3- Milkshake de Chocolate - R$5.00');
      Writeln('0- Voltar para o menu');
      Write('Escolha uma opção: ');
      Readln(respb);

     if respb = 0 then
      begin
      continue; // Volta ao início do loop
      end
         // Tratamento de excessão
      else if (respb < 0) or (respb > 3 ) then
      begin
       Writeln('Escolha inválida. Por favor, escolha um número de 0 a 3.');
        continue; // Volta ao início do loop
      end;

      Write('Quantos deseja adicionar ao pedido?');
      Readln(qtd);
      
      
      // Verifica a bebida escolhida e adiciona ao array pedido
      case respb of
        1: pedido[i] := 'Cafe Expresso';
        2: pedido[i] := 'Suco Natural de Laranja';
        3: pedido[i] := 'Milkshake de Chocolate';
      end;
        //quantidade de cada item pedido
      quantidade[i] := qtd;
      //Total de itens pedidos
      totalItens := totalItens + qtd;
      //Cálculo do valor total do pedido
      total := (total + bebidasPrecos[respb] ) * qtd;
      // Mensagem de confirmação
      Writeln('');
      Writeln('Pedido adicionado! Preço atual do pedido: R$', total:0:2);
      Writeln('----------------------------------------');
      i := i + 1;
    end;
       
    // Mostra o pedido pro usuário caso selecionar opção 3 no menu
    if respm = 3 then
    begin
      Writeln('Pedidos para ', cliente, ':');
      Writeln('----------------------------------------');

      for n := 1 to i - 1 do
      begin
        Writeln('(', quantidade[n], 'x) ', pedido[n]);
        Writeln('');
      end;
      Writeln('Total de itens no pedido: ', totalItens);
      Writeln('Preço total do pedido: R$', total:0:2);
      Writeln('----------------------------------------');
    end;

  // Finaliza o pedido do usuario caso selecionar 4 no menu
   if respm = 4 then
    begin
      Writeln('Pedido Finalizado! Obrigado por comprar conosco ', cliente);
      Writeln('----------------------------------------');

      for n := 1 to i - 1 do   
      begin
        Writeln('(', quantidade[n], 'x) ', pedido[n]);
        Writeln('');
      end;
      Writeln('Total de itens no pedido: ', totalItens);
      Writeln('Preço total do pedido: R$', total:0:2);
      Writeln('----------------------------------------');
    end;

   // Limpa o pedido do usuario caso selecionar 5 no menu
    if respm = 5 then
    begin
      totalItens := 0;
      LimparPedido;
      Writeln('----------------------------------------');
      Writeln('Pedido Cancelado! Todos os itens foram removidos.');
      Writeln('----------------------------------------');
    end;

  // Encerra o sistema.
until respm = 0;
  writeln('Encerrando seus pedidos!...');
 

end.
