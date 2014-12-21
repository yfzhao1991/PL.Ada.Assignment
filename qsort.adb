with text_io;
use text_io;

package body qsort is
package int_io is new integer_io(integer);
use int_io;

procedure quicksort(a:in out table) is
m:integer;
x:integer;
y:integer;
z:integer;
i:integer;
j:integer;
temp:integer;
begin
	if a'length=1 then
		return;
	else
		if a'length=2 then
			if a(a'first)<a(a'last) then
				m:=a(a'first);
			else
				m:=a(a'last);
			end if;
		else
			x:=a(a'first);
			y:=a((a'first+a'last)/2);
			z:=a(a'last);
			if x<y then
				if y<z then
					m:=y;
				elsif x>z then
					m:=x;
				else
					m:=z;
				end if;
			else
				if y>z then
					m:=y;
				elsif x>z then
					m:=z;
				else
					m:=x;
				end if;
			end if;
		end if;
		i:=a'first;
		j:=a'last;
		while i<j loop
			while i<a'last and a(i)<=m loop
				i:=i+1;
			end loop;
			while j>a'first and a(j)>m loop
				j:=j-1;
			end loop;
			if i<j then
				temp:=a(i);
				a(i):=a(j);
				a(j):=temp;
			end if;
		end loop;
		if i<a'last then
			quicksort(a(i..a'last));
		end if;
		if j>a'first then
			quicksort(a(a'first..j));
		end if;
	end if;
end quicksort;

end qsort;
