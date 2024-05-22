
# RISC-V CPU Instructions testing for riscv\_cpu\_ver3 (dp + cltr + pipeline + control hazard + forwarding)
### The top module you need to compile is rsicv_cpu_ver3. (Datapath + controller + pipeline + Hazard)
### It will caculate and store numbers in the Fibonacci number array to register x0 with the figure of elements in the array as input N.
---
```c
        addi x0, x5, 0 
        addi x1, x5, 1 
        addi x2, x5, 1 
        addi x3, x5, 15   //The final value stored in x0 is the 15th fibonacci number
        loop:
        beq x2, x3, end 
        add x4, x0, x1
        add x0, x5, x1
        add x1, x5, x4
        addi x2, x2, 1
        jal x6, loop 
        end:
        addi x2, x5, 0    //The final value stored in x2 is 0 which is the signal for the end
```
