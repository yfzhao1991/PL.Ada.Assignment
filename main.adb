with qsort,text_io;
use qsort,text_io;

procedure main is

package int_io is new integer_io(integer);
use int_io;

a:table(1..30);
sum:integer:=0;

task Printer is
	entry Print;
	entry Print2;
	entry Print3;
end Printer;
task Sorter is
	entry Sort;
end Sorter;
task Adder is
	entry Add;
end Adder;

task body Printer is
begin
	accept Print;
	for i in 1..30 loop
		put(a(i));
	end loop;
	new_line;
	Sorter.Sort;
	accept Print2;
	for i in 1..30 loop
		put(a(i));
	end loop;
	new_line;
	new_line;
	accept Print3;
	put(sum);
end Printer;

task body Sorter is
begin
	accept Sort;
	quicksort(a);
	new_line;
	Printer.Print2;
	Adder.Add;
end Sorter;

task body Adder is
begin
	accept Add;
	for i in 1..30 loop
		sum:=sum+a(i);
	end loop;
	Printer.Print3;
end Adder;

begin
	for i in 1..30 loop
		get(a(i));
	end loop;
	Printer.Print;
end main;
