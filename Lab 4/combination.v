module checkCombination (Attempt, Combination, Alarm, Gate, Tries);
   
   input [3:0] Attempt, Combination;
    output Alarm, Gate;
    Tries = 1'b0;
    
    always @(Clock)
    if(Attempt == Combination)
        Tries <= 1'b0;
        Gate <= 1'b1;
    else
        Gate <= 1'b0
        if(Tries == 1'b0)
            Tries <= 1'b1;
        else
            Alarm <= 1'b1;
    
 
endmodule


module flipflop (D, Clock, Q);
    input [3:0] D;
    input Clock;
    output reg [3:0] Q;

    always @(posedge Clock)
        Q <= D;
endmodule

module reg4 (D, Clock, Resetn, Q);
    input [2:0] D;
    input Clock, Resetn;
    output reg [2:0] Q;

    always @(posedge Clock, negedge Resetn)
    if (Resetn == 0)
        Q <= 0;
    else
        Q <= D;
endmodule