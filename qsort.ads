with text_io;
use text_io;

package qsort is 
type table is array(Positive range <>) of Integer;
procedure quicksort(a:in out table);
end qsort;
