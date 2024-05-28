module fulladdr (
    Sum,Carry,a,b,c
);
input a,b,c;
output Sum,Carry;
wire t0,t1,t2,t3,t4;
xor    G1(t0,a,b);
xor    G2(Sum,t0,c);
and    G3(t1,a,b);
and    G4(t2,b,c);
and    G5(t3,a,c);
or     G6(t4,t1,t2);
or     G7(Carry,t4,t3);
endmodule
// eval "$(/opt/homebrew/bin/brew shellenv)"