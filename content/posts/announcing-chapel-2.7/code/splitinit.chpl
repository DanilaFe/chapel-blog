proc initVars(out x, out y: [1..10] int) {
  x = 3.14;
}
const c, C; // initialized below
initVars(c, C);
c = 2.71; // cannot modify const, so error.

var d: int;
d = 1.0; // not valid: cannot coerce real to int

var e: real;
var cond = true;
if cond {
  e = 1.0;
} else {
  e = 2; // coercions now allowed
}
