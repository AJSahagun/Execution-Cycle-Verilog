//  lets say for lw $t0, 40($s3)
 
 module load_operation (
       input destination,   //this is $t0
       input base,          //this is $t3
       input offset,        //this is 40
       output out);

        assign out = a ^ b;
    
 endmodule