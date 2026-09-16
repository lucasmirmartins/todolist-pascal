program TodoList;

const
  MAX_TAREFAS = 100;

type
  Tarefa = record
    descricao: string;
    concluida: boolean;
  end;

var
  tarefas: array[1..MAX_TAREFAS] of Tarefa;
  totalTarefas: integer;

{ ---------------- PROCEDURES ---------------- }

procedure MostrarMenu;
begin
  writeln;
  writeln('====== TO-DO LIST ======');
  writeln('1 - Adicionar tarefa');
  writeln('2 - Listar tarefas');
  writeln('3 - Concluir tarefa');
  writeln('4 - Remover tarefa');
  writeln('0 - Sair');
  writeln('========================');
  write('Escolha uma opcao: ');
end;

procedure AdicionarTarefa;
begin
  if totalTarefas >= MAX_TAREFAS then
  begin
    writeln('Limite de tarefas atingido.');
    exit;
  end;

  inc(totalTarefas);
  write('Digite a descricao da tarefa: ');
  readln(tarefas[totalTarefas].descricao);
  tarefas[totalTarefas].concluida := false;

  writeln('Tarefa adicionada com sucesso!');
end;

procedure ListarTarefas;
var
  i: integer;
begin
  if totalTarefas = 0 then
  begin
    writeln('Nenhuma tarefa cadastrada.');
    exit;
  end;

  writeln;
  writeln('------ LISTA DE TAREFAS ------');
  for i := 1 to totalTarefas do
  begin
    write(i, ' - ', tarefas[i].descricao);
    if tarefas[i].concluida then
      writeln(' [CONCLUIDA]')
    else
      writeln(' [PENDENTE]');
  end;
end;

procedure ConcluirTarefa;
var
  indice: integer;
begin
  ListarTarefas;
  write('Digite o numero da tarefa a concluir: ');
  readln(indice);

  if (indice < 1) or (indice > totalTarefas) then
  begin
    writeln('Tarefa invalida.');
    exit;
  end;

  tarefas[indice].concluida := true;
  writeln('Tarefa marcada como concluida.');
end;

procedure RemoverTarefa;
var
  indice, i: integer;
begin
  ListarTarefas;
  write('Digite o numero da tarefa a remover: ');
  readln(indice);

  if (indice < 1) or (indice > totalTarefas) then
  begin
    writeln('Tarefa invalida.');
    exit;
  end;

  for i := indice to totalTarefas - 1 do
    tarefas[i] := tarefas[i + 1];

  dec(totalTarefas);
  writeln('Tarefa removida com sucesso.');
end;

{ ---------------- PROGRAMA PRINCIPAL ---------------- }

var
  opcao: integer;

begin
  totalTarefas := 0;

  repeat
    MostrarMenu;
    readln(opcao);

    case opcao of
      1: AdicionarTarefa;
      2: ListarTarefas;
      3: ConcluirTarefa;
      4: RemoverTarefa;
      0: writeln('Encerrando o programa...');
    else
      writeln('Opcao invalida.');
    end;

  until opcao = 0;
end.
