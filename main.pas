Program missionX;

Type
	iPerm    = String[5];
	// ---------------class Node-------------------
	Node = Object
				perm : iPerm;
				children: array[1..10] of ^Node;
				Constructor Init;
				Destructor Done;

				//function isLeaf(): boolean;
		   End;

// global variabless
const
MAX = 10; // maximal queue length
STACK_SIZE = 10;
Var
ip, tp: String;
N, i, j, k, d, perm_cnt: Integer;
root, root1: ^Node;
test: Node;
NodesQueue : array[1..MAX] of Node;
// for queue
HeadIndex, RearIndex, QueueLength: Integer;

Constructor Node.Init;
begin
 Writeln ('Initializing an instance of Node !');
end;

Destructor Node.Done;
begin
  Writeln ('Destroying an instance of Node !');
end;

{function Node.isLeaf(): boolean;
begin
	if perm.
end;
}
	// http://www.pp4s.co.uk/main/tu-lsq-cqueues-demo.html
	// --------------- queue ---------------------


	procedure Enqueue(LastNode: Node);
	begin
	  if QueueLength < MAX then
	    begin
	      RearIndex := (RearIndex MOD MAX) + 1;
	      NodesQueue[RearIndex]:= LastNode;
	      inc(QueueLength);
	    end
	  else
	    writeln('Queue full')
	end;

	function Dequeue : Node;
	begin
	  if QueueLength = 0 then
	    writeln('Queue is empty')
	  else
	    begin
	      Dequeue := NodesQueue[HeadIndex];
	      HeadIndex := (HeadIndex MOD MAX) + 1;
	      dec(QueueLength);
	    end;
	end;

procedure InitQueue;
begin
	HeadIndex := 1;
	RearIndex := MAX;
	QueueLength := 0;
end;

// procedura otoci substring v retazci y zacinajuci na indexe A a konciaci na indexe B
Procedure swap(A: Integer; B: Integer; Var y: String);
Var
max: Integer;
temp: Char;
Begin
	if Length(y)< B then
		Begin
		writeln('Index out of bounds! Exiting procedure swap.');
		exit();
		End;
max:=((B-A+1) div 2);
for i:=1 to max do
        Begin
		writeln('Swapping at indexes ', A, ' and ', B);
        temp:=y[A];
        y[A]:=y[B];
        y[B]:=temp;
        A:=A+1;
        B:=B-1;
        End;
End;

// Procedure to create the three. k is width of a string to be rotated.
Procedure createChildrenNodes(var node: Node; var depth: Integer);
Var
il, jl, count: Integer;
temp: ^Node;
Begin
count:=0;
depth:=depth+1;
	if(depth<N) then
	for jl := 1 to N-1 do 
	for il := 1 to N-jl do
		Begin
			count := count+1;
			New(temp, Init);
			temp^.perm := node.perm;
			swap(jl,il+jl,temp^.perm);
			writeln('Depth: ',depth,', Child node ', jl,':', il+jl , ' with permutation: ', temp^.perm);
			node.children[count] := temp;
			perm_cnt:=perm_cnt+1;
			//writeln('Child permutation: ', node.children[il]^.perm);
			createChildrenNodes(node.children[count]^, depth);
		End;
	depth:=depth-1;
End;

Procedure printTree(root: Node);
Var
i: Integer;
Begin
	for i :=1 to 10 do
	Begin
		writeln(i, ': ' ,root.perm);
		if root.children[i]<>Nil then
		printTree(root.children[i]^);
	End;
End;

function BFS(root: Node; goal: iPerm): boolean;
Var
children: array[1..10] of ^Node;
i: integer;
t: Node;
begin

	Enqueue(root);

	while(QueueLength<>0) do
	begin
		t := NodesQueue[HeadIndex];
		//path += t.getValue();
		writeln('Accessed node: ', t.perm);
		Dequeue();

		if(t.perm = goal) then
			begin
			writeln('Match found, exiting BFS');
			exit(TRUE);
			end;
		//children := t.children;
		if t.children[1]<>Nil then
		for i := 1 to 10 do
		begin
			writeln('Enqueuing: ', t.children[i]^.perm);
			Enqueue(t.children[i]^);
		end;
	end;
	BFS:=TRUE;
end;



Begin
// length of the permutation
N := 4;
d:=0;
perm_cnt:=0;
InitQueue;

// example permutations
tp := '1233';
ip := '3431';


writeln('Target permutation: ', tp);
writeln('Initial permutation: ', ip);

test.perm:='5555';
New(root, Init);
root^.perm:=ip;
New(root1, Init);
root1^.perm:=tp;

{Enqueue(test);
Enqueue(root^);
writeln('Head: ', NodesQueue[HeadIndex].perm);
writeln('Queuelength: ', QueueLength);
Dequeue();
writeln('Head: ', NodesQueue[HeadIndex].perm);
writeln('Queuelength: ', QueueLength);}



createChildrenNodes(root^, d);
//writeln(root^.children[1]^.perm);
//BFS(root^, '12345');


writeln('Permutations count: ', perm_cnt);
End.
