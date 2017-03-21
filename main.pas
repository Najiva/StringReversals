Program missionX;

Type
	iPerm    = String[5];
	// class Node
	Node = Object
				perm : iPerm;
				children: array[1..10] of ^Node;
				Constructor Init;
				Destructor Done;
		   End;

// global variabless
Var
fp, tp: String;
N, i, j, k: Integer;
root: ^Node;

Constructor Node.Init;

begin
 Writeln ('Initializing an instance of Node !');
end;

Destructor Node.Done;

begin
  Writeln ('Destroying an instance of Node !');
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
			swap(il,il+1,fp);
			temp^.perm := fp;
			swap(il,il+1,fp);
			node.children[il] := temp;
		End;
End;

Procedure printTree(root: Node);
Var
i: Integer;
Begin
	for i :=1 to 10 do 
	Begin
		writeln(root.perm);
		if root.children[i]<>Nil then
		printTree(root.children[i]^);
	End;
End;


Begin
// length of the permutation
N := 5;

// example permutations
tp := '12334';
fp := '34321';

New(root, Init);
root^.perm:=fp;

j := 1;
k := 5;

createChildrenNodes(root^);
printTree(root^);


swap(j,k,fp);
writeln(fp);


End.
