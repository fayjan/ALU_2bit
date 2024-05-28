module halfaddr (
    s,c,a,b
);
input a,b;
output s,c;
xor G1(s,a,b);
and G2(c,a,b);
endmodule
// eval "$(/opt/homebrew/bin/brew shellenv)"