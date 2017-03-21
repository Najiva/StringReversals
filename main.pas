Program missionX;

Type
	iPerm    = String[5];
	// ---------------class Node-------------------
	Node = Object
				perm : iPerm;
				children: array[1..10] of ^Node;
				Constructor Init;
				Destructor Done;
		   End;

// global variabless
const
  qLength = 10; // maximal queue length
Var
ip, tp: String;
N, i, j, k: Integer;
root, root1: ^Node;
NodesQueue : array[1..qLength] of ^Node;
HeadIndex, RearIndex: Integer;

Constructor Node.Init;
begin
 Writeln ('Initializing an instance of Node !');
end;

Destructor Node.Done;
begin
  Writeln ('Destroying an instance of Node !');
end;
	// --------------- queue ---------------------

procedure Enqueue(var LastNode: Node);
begin
  if RearIndex < qLength then
    begin
      inc(RearIndex);
			writeln('Enqueing node with perm: ', LastNode.perm);
      NodesQueue[RearIndex] := @LastNode;
    end
  else
    writeln('Queue full')
end;

function Dequeue : Node;
begin
	  if HeadIndex <= RearIndex then
	    begin
				writeln('Dequeing node with perm: ', NodesQueue[HeadIndex]^.perm);
	      Dequeue := NodesQueue[HeadIndex]^;
	      inc(HeadIndex);
	    end
	  else
			begin
			writeln('Queue is empty');
			end;
end;

procedure InitQueue;
begin
   HeadIndex := 1;
   RearIndex := 0;
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


Begin
// length of the permutation
N := 5;
InitQueue;

// example permutations
tp := '12334';
ip := '34321';


writeln('Target permutation: ', tp);
writeln('Initial permutation: ', ip);

New(root, Init);
root^.perm:=ip;
New(root1, Init);
root1^.perm:=tp;
Enqueue(root1^);
Enqueue(root^);
Enqueue(root^);
Dequeue();
Enqueue(root1^);


{j := 1;
k := 5;

createChildrenNodes(root^);
printTree(root^);


swap(j,k,ip);
writeln(ip);}


End.
