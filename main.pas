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
N, i, j, k: Integer;
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

Procedure createChildrenNodes(node: Node);
Var
il: Integer;
temp: ^Node;
Begin
	for il := 1 to N-1 do
		Begin
			New(temp, Init);
			temp^.perm := node.perm;
			swap(il,il+1,temp^.perm);
			writeln('Creating child node with permutation: ', temp^.perm);
			//swap(il,il+1,node.perm);
			node.children[il] := temp;
		End;
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

function BFS(root: Node; goal: Node): boolean;
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

		Dequeue();

		if(t.perm = goal.perm) then
			begin
			exit(TRUE);
			end;
		//children = t.getChildren();
		for i := 0 to 10 do
		begin
			Enqueue(root.children[i]^);
		end;
	end;
	BFS:=TRUE;
end;



Begin
// length of the permutation
N := 5;
InitQueue;

// example permutations
tp := '12334';
ip := '34321';


writeln('Target permutation: ', tp);
writeln('Initial permutation: ', ip);

test.perm:='55555';
New(root, Init);
root^.perm:=ip;
New(root1, Init);
root1^.perm:=tp;

Enqueue(test);
Enqueue(root^);
writeln('Head: ', NodesQueue[HeadIndex].perm);
writeln('Queuelength: ', QueueLength);
Dequeue();
writeln('Head: ', NodesQueue[HeadIndex].perm);
writeln('Queuelength: ', QueueLength);


{j := 1;
k := 5;

createChildrenNodes(root^);
printTree(root^);


swap(j,k,ip);
writeln(ip);}


End.
