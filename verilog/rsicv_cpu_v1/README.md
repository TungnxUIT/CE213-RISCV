  RISC-V CPU Instructions body { font-family: 'Courier New', monospace; background-color: #f4f4f4; margin: 0; padding: 20px; } h1 { color: #333; text-align: center; } pre { background-color: #fff; border: 1px solid #ddd; padding: 20px; overflow-x: auto; white-space: pre-wrap; }

RISC-V CPU Instructions for riscv\_cpu\_ver1 (dp + cltr)
========================================================

        addi $0, $1, 8       //$0 = 8
        sw $0, 1($2)
        lw $1, 1($2)        //$1 = 8
        mul $3, $0, $1     //$3 = 64
        beq $0, $1, End     //will make a branch
        add $3, $0, $1      //$3 = 16
        End: lui $4, 0xFFFFF      //$4 = -4096