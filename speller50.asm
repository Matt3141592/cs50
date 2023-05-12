
speller50:     file format elf64-x86-64


Disassembly of section .init:

0000000000400690 <_init>:
  400690:	48 83 ec 08          	sub    $0x8,%rsp
  400694:	48 8b 05 5d 19 20 00 	mov    0x20195d(%rip),%rax        # 601ff8 <__gmon_start__>
  40069b:	48 85 c0             	test   %rax,%rax
  40069e:	74 02                	je     4006a2 <_init+0x12>
  4006a0:	ff d0                	callq  *%rax
  4006a2:	48 83 c4 08          	add    $0x8,%rsp
  4006a6:	c3                   	retq   

Disassembly of section .plt:

00000000004006b0 <.plt>:
  4006b0:	ff 35 52 19 20 00    	pushq  0x201952(%rip)        # 602008 <_GLOBAL_OFFSET_TABLE_+0x8>
  4006b6:	ff 25 54 19 20 00    	jmpq   *0x201954(%rip)        # 602010 <_GLOBAL_OFFSET_TABLE_+0x10>
  4006bc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004006c0 <free@plt>:
  4006c0:	ff 25 52 19 20 00    	jmpq   *0x201952(%rip)        # 602018 <free@GLIBC_2.2.5>
  4006c6:	68 00 00 00 00       	pushq  $0x0
  4006cb:	e9 e0 ff ff ff       	jmpq   4006b0 <.plt>

00000000004006d0 <strcasecmp@plt>:
  4006d0:	ff 25 4a 19 20 00    	jmpq   *0x20194a(%rip)        # 602020 <strcasecmp@GLIBC_2.2.5>
  4006d6:	68 01 00 00 00       	pushq  $0x1
  4006db:	e9 d0 ff ff ff       	jmpq   4006b0 <.plt>

00000000004006e0 <__isoc99_fscanf@plt>:
  4006e0:	ff 25 42 19 20 00    	jmpq   *0x201942(%rip)        # 602028 <__isoc99_fscanf@GLIBC_2.7>
  4006e6:	68 02 00 00 00       	pushq  $0x2
  4006eb:	e9 c0 ff ff ff       	jmpq   4006b0 <.plt>

00000000004006f0 <ferror@plt>:
  4006f0:	ff 25 3a 19 20 00    	jmpq   *0x20193a(%rip)        # 602030 <ferror@GLIBC_2.2.5>
  4006f6:	68 03 00 00 00       	pushq  $0x3
  4006fb:	e9 b0 ff ff ff       	jmpq   4006b0 <.plt>

0000000000400700 <fread@plt>:
  400700:	ff 25 32 19 20 00    	jmpq   *0x201932(%rip)        # 602038 <fread@GLIBC_2.2.5>
  400706:	68 04 00 00 00       	pushq  $0x4
  40070b:	e9 a0 ff ff ff       	jmpq   4006b0 <.plt>

0000000000400710 <fclose@plt>:
  400710:	ff 25 2a 19 20 00    	jmpq   *0x20192a(%rip)        # 602040 <fclose@GLIBC_2.2.5>
  400716:	68 05 00 00 00       	pushq  $0x5
  40071b:	e9 90 ff ff ff       	jmpq   4006b0 <.plt>

0000000000400720 <printf@plt>:
  400720:	ff 25 22 19 20 00    	jmpq   *0x201922(%rip)        # 602048 <printf@GLIBC_2.2.5>
  400726:	68 06 00 00 00       	pushq  $0x6
  40072b:	e9 80 ff ff ff       	jmpq   4006b0 <.plt>

0000000000400730 <tolower@plt>:
  400730:	ff 25 1a 19 20 00    	jmpq   *0x20191a(%rip)        # 602050 <tolower@GLIBC_2.2.5>
  400736:	68 07 00 00 00       	pushq  $0x7
  40073b:	e9 70 ff ff ff       	jmpq   4006b0 <.plt>

0000000000400740 <malloc@plt>:
  400740:	ff 25 12 19 20 00    	jmpq   *0x201912(%rip)        # 602058 <malloc@GLIBC_2.2.5>
  400746:	68 08 00 00 00       	pushq  $0x8
  40074b:	e9 60 ff ff ff       	jmpq   4006b0 <.plt>

0000000000400750 <fopen@plt>:
  400750:	ff 25 0a 19 20 00    	jmpq   *0x20190a(%rip)        # 602060 <fopen@GLIBC_2.2.5>
  400756:	68 09 00 00 00       	pushq  $0x9
  40075b:	e9 50 ff ff ff       	jmpq   4006b0 <.plt>

0000000000400760 <getrusage@plt>:
  400760:	ff 25 02 19 20 00    	jmpq   *0x201902(%rip)        # 602068 <getrusage@GLIBC_2.2.5>
  400766:	68 0a 00 00 00       	pushq  $0xa
  40076b:	e9 40 ff ff ff       	jmpq   4006b0 <.plt>

0000000000400770 <__ctype_b_loc@plt>:
  400770:	ff 25 fa 18 20 00    	jmpq   *0x2018fa(%rip)        # 602070 <__ctype_b_loc@GLIBC_2.3>
  400776:	68 0b 00 00 00       	pushq  $0xb
  40077b:	e9 30 ff ff ff       	jmpq   4006b0 <.plt>

Disassembly of section .text:

0000000000400780 <_start>:
  400780:	31 ed                	xor    %ebp,%ebp
  400782:	49 89 d1             	mov    %rdx,%r9
  400785:	5e                   	pop    %rsi
  400786:	48 89 e2             	mov    %rsp,%rdx
  400789:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40078d:	50                   	push   %rax
  40078e:	54                   	push   %rsp
  40078f:	49 c7 c0 50 13 40 00 	mov    $0x401350,%r8
  400796:	48 c7 c1 e0 12 40 00 	mov    $0x4012e0,%rcx
  40079d:	48 c7 c7 70 08 40 00 	mov    $0x400870,%rdi
  4007a4:	ff 15 46 18 20 00    	callq  *0x201846(%rip)        # 601ff0 <__libc_start_main@GLIBC_2.2.5>
  4007aa:	f4                   	hlt    
  4007ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004007b0 <_dl_relocate_static_pie>:
  4007b0:	f3 c3                	repz retq 
  4007b2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4007b9:	00 00 00 
  4007bc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004007c0 <deregister_tm_clones>:
  4007c0:	55                   	push   %rbp
  4007c1:	b8 88 20 60 00       	mov    $0x602088,%eax
  4007c6:	48 3d 88 20 60 00    	cmp    $0x602088,%rax
  4007cc:	48 89 e5             	mov    %rsp,%rbp
  4007cf:	74 17                	je     4007e8 <deregister_tm_clones+0x28>
  4007d1:	b8 00 00 00 00       	mov    $0x0,%eax
  4007d6:	48 85 c0             	test   %rax,%rax
  4007d9:	74 0d                	je     4007e8 <deregister_tm_clones+0x28>
  4007db:	5d                   	pop    %rbp
  4007dc:	bf 88 20 60 00       	mov    $0x602088,%edi
  4007e1:	ff e0                	jmpq   *%rax
  4007e3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4007e8:	5d                   	pop    %rbp
  4007e9:	c3                   	retq   
  4007ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004007f0 <register_tm_clones>:
  4007f0:	be 88 20 60 00       	mov    $0x602088,%esi
  4007f5:	55                   	push   %rbp
  4007f6:	48 81 ee 88 20 60 00 	sub    $0x602088,%rsi
  4007fd:	48 89 e5             	mov    %rsp,%rbp
  400800:	48 c1 fe 03          	sar    $0x3,%rsi
  400804:	48 89 f0             	mov    %rsi,%rax
  400807:	48 c1 e8 3f          	shr    $0x3f,%rax
  40080b:	48 01 c6             	add    %rax,%rsi
  40080e:	48 d1 fe             	sar    %rsi
  400811:	74 15                	je     400828 <register_tm_clones+0x38>
  400813:	b8 00 00 00 00       	mov    $0x0,%eax
  400818:	48 85 c0             	test   %rax,%rax
  40081b:	74 0b                	je     400828 <register_tm_clones+0x38>
  40081d:	5d                   	pop    %rbp
  40081e:	bf 88 20 60 00       	mov    $0x602088,%edi
  400823:	ff e0                	jmpq   *%rax
  400825:	0f 1f 00             	nopl   (%rax)
  400828:	5d                   	pop    %rbp
  400829:	c3                   	retq   
  40082a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400830 <__do_global_dtors_aux>:
  400830:	80 3d 59 18 20 00 00 	cmpb   $0x0,0x201859(%rip)        # 602090 <completed.7698>
  400837:	75 17                	jne    400850 <__do_global_dtors_aux+0x20>
  400839:	55                   	push   %rbp
  40083a:	48 89 e5             	mov    %rsp,%rbp
  40083d:	e8 7e ff ff ff       	callq  4007c0 <deregister_tm_clones>
  400842:	c6 05 47 18 20 00 01 	movb   $0x1,0x201847(%rip)        # 602090 <completed.7698>
  400849:	5d                   	pop    %rbp
  40084a:	c3                   	retq   
  40084b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400850:	f3 c3                	repz retq 
  400852:	0f 1f 40 00          	nopl   0x0(%rax)
  400856:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40085d:	00 00 00 

0000000000400860 <frame_dummy>:
  400860:	55                   	push   %rbp
  400861:	48 89 e5             	mov    %rsp,%rbp
  400864:	5d                   	pop    %rbp
  400865:	eb 89                	jmp    4007f0 <register_tm_clones>
  400867:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40086e:	00 00 

0000000000400870 <main>:
  400870:	55                   	push   %rbp
  400871:	48 89 e5             	mov    %rsp,%rbp
  400874:	48 81 ec 40 02 00 00 	sub    $0x240,%rsp
  40087b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  400882:	89 7d f8             	mov    %edi,-0x8(%rbp)
  400885:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  400889:	83 7d f8 02          	cmpl   $0x2,-0x8(%rbp)
  40088d:	0f 84 2d 00 00 00    	je     4008c0 <main+0x50>
  400893:	83 7d f8 03          	cmpl   $0x3,-0x8(%rbp)
  400897:	0f 84 23 00 00 00    	je     4008c0 <main+0x50>
  40089d:	48 bf 70 13 40 00 00 	movabs $0x401370,%rdi
  4008a4:	00 00 00 
  4008a7:	b0 00                	mov    $0x0,%al
  4008a9:	e8 72 fe ff ff       	callq  400720 <printf@plt>
  4008ae:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  4008b5:	89 85 40 fe ff ff    	mov    %eax,-0x1c0(%rbp)
  4008bb:	e9 c8 06 00 00       	jmpq   400f88 <main+0x718>
  4008c0:	0f 57 c0             	xorps  %xmm0,%xmm0
  4008c3:	f2 0f 11 85 c8 fe ff 	movsd  %xmm0,-0x138(%rbp)
  4008ca:	ff 
  4008cb:	f2 0f 11 85 c0 fe ff 	movsd  %xmm0,-0x140(%rbp)
  4008d2:	ff 
  4008d3:	f2 0f 11 85 b8 fe ff 	movsd  %xmm0,-0x148(%rbp)
  4008da:	ff 
  4008db:	f2 0f 11 85 b0 fe ff 	movsd  %xmm0,-0x150(%rbp)
  4008e2:	ff 
  4008e3:	83 7d f8 03          	cmpl   $0x3,-0x8(%rbp)
  4008e7:	0f 85 14 00 00 00    	jne    400901 <main+0x91>
  4008ed:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  4008f1:	48 8b 40 08          	mov    0x8(%rax),%rax
  4008f5:	48 89 85 38 fe ff ff 	mov    %rax,-0x1c8(%rbp)
  4008fc:	e9 16 00 00 00       	jmpq   400917 <main+0xa7>
  400901:	48 b8 94 13 40 00 00 	movabs $0x401394,%rax
  400908:	00 00 00 
  40090b:	48 89 85 38 fe ff ff 	mov    %rax,-0x1c8(%rbp)
  400912:	e9 00 00 00 00       	jmpq   400917 <main+0xa7>
  400917:	48 8b 85 38 fe ff ff 	mov    -0x1c8(%rbp),%rax
  40091e:	31 ff                	xor    %edi,%edi
  400920:	48 89 85 a8 fe ff ff 	mov    %rax,-0x158(%rbp)
  400927:	48 8d b5 60 ff ff ff 	lea    -0xa0(%rbp),%rsi
  40092e:	e8 2d fe ff ff       	callq  400760 <getrusage@plt>
  400933:	48 8b bd a8 fe ff ff 	mov    -0x158(%rbp),%rdi
  40093a:	89 85 34 fe ff ff    	mov    %eax,-0x1cc(%rbp)
  400940:	e8 eb 07 00 00       	callq  401130 <load>
  400945:	31 ff                	xor    %edi,%edi
  400947:	24 01                	and    $0x1,%al
  400949:	88 85 a7 fe ff ff    	mov    %al,-0x159(%rbp)
  40094f:	48 8d b5 d0 fe ff ff 	lea    -0x130(%rbp),%rsi
  400956:	e8 05 fe ff ff       	callq  400760 <getrusage@plt>
  40095b:	f6 85 a7 fe ff ff 01 	testb  $0x1,-0x159(%rbp)
  400962:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
  400968:	0f 85 2a 00 00 00    	jne    400998 <main+0x128>
  40096e:	48 8b b5 a8 fe ff ff 	mov    -0x158(%rbp),%rsi
  400975:	48 bf a7 13 40 00 00 	movabs $0x4013a7,%rdi
  40097c:	00 00 00 
  40097f:	b0 00                	mov    $0x0,%al
  400981:	e8 9a fd ff ff       	callq  400720 <printf@plt>
  400986:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  40098d:	89 85 2c fe ff ff    	mov    %eax,-0x1d4(%rbp)
  400993:	e9 f0 05 00 00       	jmpq   400f88 <main+0x718>
  400998:	48 8d bd 60 ff ff ff 	lea    -0xa0(%rbp),%rdi
  40099f:	48 8d b5 d0 fe ff ff 	lea    -0x130(%rbp),%rsi
  4009a6:	e8 f5 05 00 00       	callq  400fa0 <calculate>
  4009ab:	f2 0f 11 85 c8 fe ff 	movsd  %xmm0,-0x138(%rbp)
  4009b2:	ff 
  4009b3:	83 7d f8 03          	cmpl   $0x3,-0x8(%rbp)
  4009b7:	0f 85 14 00 00 00    	jne    4009d1 <main+0x161>
  4009bd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  4009c1:	48 8b 40 10          	mov    0x10(%rax),%rax
  4009c5:	48 89 85 20 fe ff ff 	mov    %rax,-0x1e0(%rbp)
  4009cc:	e9 0f 00 00 00       	jmpq   4009e0 <main+0x170>
  4009d1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  4009d5:	48 8b 40 08          	mov    0x8(%rax),%rax
  4009d9:	48 89 85 20 fe ff ff 	mov    %rax,-0x1e0(%rbp)
  4009e0:	48 8b 85 20 fe ff ff 	mov    -0x1e0(%rbp),%rax
  4009e7:	48 89 85 98 fe ff ff 	mov    %rax,-0x168(%rbp)
  4009ee:	48 8b bd 98 fe ff ff 	mov    -0x168(%rbp),%rdi
  4009f5:	48 be bb 13 40 00 00 	movabs $0x4013bb,%rsi
  4009fc:	00 00 00 
  4009ff:	e8 4c fd ff ff       	callq  400750 <fopen@plt>
  400a04:	48 89 85 90 fe ff ff 	mov    %rax,-0x170(%rbp)
  400a0b:	48 83 bd 90 fe ff ff 	cmpq   $0x0,-0x170(%rbp)
  400a12:	00 
  400a13:	0f 85 35 00 00 00    	jne    400a4e <main+0x1de>
  400a19:	48 8b b5 98 fe ff ff 	mov    -0x168(%rbp),%rsi
  400a20:	48 bf bd 13 40 00 00 	movabs $0x4013bd,%rdi
  400a27:	00 00 00 
  400a2a:	b0 00                	mov    $0x0,%al
  400a2c:	e8 ef fc ff ff       	callq  400720 <printf@plt>
  400a31:	89 85 1c fe ff ff    	mov    %eax,-0x1e4(%rbp)
  400a37:	e8 14 08 00 00       	callq  401250 <unload>
  400a3c:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  400a43:	88 85 1b fe ff ff    	mov    %al,-0x1e5(%rbp)
  400a49:	e9 3a 05 00 00       	jmpq   400f88 <main+0x718>
  400a4e:	48 bf d1 13 40 00 00 	movabs $0x4013d1,%rdi
  400a55:	00 00 00 
  400a58:	b0 00                	mov    $0x0,%al
  400a5a:	e8 c1 fc ff ff       	callq  400720 <printf@plt>
  400a5f:	c7 85 8c fe ff ff 00 	movl   $0x0,-0x174(%rbp)
  400a66:	00 00 00 
  400a69:	c7 85 88 fe ff ff 00 	movl   $0x0,-0x178(%rbp)
  400a70:	00 00 00 
  400a73:	c7 85 84 fe ff ff 00 	movl   $0x0,-0x17c(%rbp)
  400a7a:	00 00 00 
  400a7d:	89 85 14 fe ff ff    	mov    %eax,-0x1ec(%rbp)
  400a83:	48 8b 8d 90 fe ff ff 	mov    -0x170(%rbp),%rcx
  400a8a:	48 8d bd 4f fe ff ff 	lea    -0x1b1(%rbp),%rdi
  400a91:	b8 01 00 00 00       	mov    $0x1,%eax
  400a96:	48 89 c6             	mov    %rax,%rsi
  400a99:	48 89 c2             	mov    %rax,%rdx
  400a9c:	e8 5f fc ff ff       	callq  400700 <fread@plt>
  400aa1:	48 83 f8 00          	cmp    $0x0,%rax
  400aa5:	0f 84 89 02 00 00    	je     400d34 <main+0x4c4>
  400aab:	e8 c0 fc ff ff       	callq  400770 <__ctype_b_loc@plt>
  400ab0:	48 8b 00             	mov    (%rax),%rax
  400ab3:	0f be 8d 4f fe ff ff 	movsbl -0x1b1(%rbp),%ecx
  400aba:	48 63 d1             	movslq %ecx,%rdx
  400abd:	0f b7 0c 50          	movzwl (%rax,%rdx,2),%ecx
  400ac1:	81 e1 00 04 00 00    	and    $0x400,%ecx
  400ac7:	83 f9 00             	cmp    $0x0,%ecx
  400aca:	0f 85 1d 00 00 00    	jne    400aed <main+0x27d>
  400ad0:	0f be 85 4f fe ff ff 	movsbl -0x1b1(%rbp),%eax
  400ad7:	83 f8 27             	cmp    $0x27,%eax
  400ada:	0f 85 c8 00 00 00    	jne    400ba8 <main+0x338>
  400ae0:	83 bd 8c fe ff ff 00 	cmpl   $0x0,-0x174(%rbp)
  400ae7:	0f 8e bb 00 00 00    	jle    400ba8 <main+0x338>
  400aed:	8a 85 4f fe ff ff    	mov    -0x1b1(%rbp),%al
  400af3:	48 63 8d 8c fe ff ff 	movslq -0x174(%rbp),%rcx
  400afa:	88 84 0d 50 fe ff ff 	mov    %al,-0x1b0(%rbp,%rcx,1)
  400b01:	8b 95 8c fe ff ff    	mov    -0x174(%rbp),%edx
  400b07:	83 c2 01             	add    $0x1,%edx
  400b0a:	89 95 8c fe ff ff    	mov    %edx,-0x174(%rbp)
  400b10:	83 bd 8c fe ff ff 2d 	cmpl   $0x2d,-0x174(%rbp)
  400b17:	0f 8e 86 00 00 00    	jle    400ba3 <main+0x333>
  400b1d:	e9 00 00 00 00       	jmpq   400b22 <main+0x2b2>
  400b22:	48 8b 8d 90 fe ff ff 	mov    -0x170(%rbp),%rcx
  400b29:	48 8d bd 4f fe ff ff 	lea    -0x1b1(%rbp),%rdi
  400b30:	b8 01 00 00 00       	mov    $0x1,%eax
  400b35:	48 89 c6             	mov    %rax,%rsi
  400b38:	48 89 c2             	mov    %rax,%rdx
  400b3b:	e8 c0 fb ff ff       	callq  400700 <fread@plt>
  400b40:	45 31 c0             	xor    %r8d,%r8d
  400b43:	45 88 c1             	mov    %r8b,%r9b
  400b46:	48 83 f8 00          	cmp    $0x0,%rax
  400b4a:	44 88 8d 13 fe ff ff 	mov    %r9b,-0x1ed(%rbp)
  400b51:	0f 84 2a 00 00 00    	je     400b81 <main+0x311>
  400b57:	e8 14 fc ff ff       	callq  400770 <__ctype_b_loc@plt>
  400b5c:	48 8b 00             	mov    (%rax),%rax
  400b5f:	0f be 8d 4f fe ff ff 	movsbl -0x1b1(%rbp),%ecx
  400b66:	48 63 d1             	movslq %ecx,%rdx
  400b69:	0f b7 0c 50          	movzwl (%rax,%rdx,2),%ecx
  400b6d:	81 e1 00 04 00 00    	and    $0x400,%ecx
  400b73:	83 f9 00             	cmp    $0x0,%ecx
  400b76:	40 0f 95 c6          	setne  %sil
  400b7a:	40 88 b5 13 fe ff ff 	mov    %sil,-0x1ed(%rbp)
  400b81:	8a 85 13 fe ff ff    	mov    -0x1ed(%rbp),%al
  400b87:	a8 01                	test   $0x1,%al
  400b89:	0f 85 05 00 00 00    	jne    400b94 <main+0x324>
  400b8f:	e9 05 00 00 00       	jmpq   400b99 <main+0x329>
  400b94:	e9 89 ff ff ff       	jmpq   400b22 <main+0x2b2>
  400b99:	c7 85 8c fe ff ff 00 	movl   $0x0,-0x174(%rbp)
  400ba0:	00 00 00 
  400ba3:	e9 87 01 00 00       	jmpq   400d2f <main+0x4bf>
  400ba8:	e8 c3 fb ff ff       	callq  400770 <__ctype_b_loc@plt>
  400bad:	48 8b 00             	mov    (%rax),%rax
  400bb0:	0f be 8d 4f fe ff ff 	movsbl -0x1b1(%rbp),%ecx
  400bb7:	48 63 d1             	movslq %ecx,%rdx
  400bba:	0f b7 0c 50          	movzwl (%rax,%rdx,2),%ecx
  400bbe:	81 e1 00 08 00 00    	and    $0x800,%ecx
  400bc4:	83 f9 00             	cmp    $0x0,%ecx
  400bc7:	0f 84 88 00 00 00    	je     400c55 <main+0x3e5>
  400bcd:	e9 00 00 00 00       	jmpq   400bd2 <main+0x362>
  400bd2:	48 8b 8d 90 fe ff ff 	mov    -0x170(%rbp),%rcx
  400bd9:	48 8d bd 4f fe ff ff 	lea    -0x1b1(%rbp),%rdi
  400be0:	b8 01 00 00 00       	mov    $0x1,%eax
  400be5:	48 89 c6             	mov    %rax,%rsi
  400be8:	48 89 c2             	mov    %rax,%rdx
  400beb:	e8 10 fb ff ff       	callq  400700 <fread@plt>
  400bf0:	45 31 c0             	xor    %r8d,%r8d
  400bf3:	45 88 c1             	mov    %r8b,%r9b
  400bf6:	48 83 f8 00          	cmp    $0x0,%rax
  400bfa:	44 88 8d 12 fe ff ff 	mov    %r9b,-0x1ee(%rbp)
  400c01:	0f 84 27 00 00 00    	je     400c2e <main+0x3be>
  400c07:	e8 64 fb ff ff       	callq  400770 <__ctype_b_loc@plt>
  400c0c:	48 8b 00             	mov    (%rax),%rax
  400c0f:	0f be 8d 4f fe ff ff 	movsbl -0x1b1(%rbp),%ecx
  400c16:	48 63 d1             	movslq %ecx,%rdx
  400c19:	0f b7 0c 50          	movzwl (%rax,%rdx,2),%ecx
  400c1d:	83 e1 08             	and    $0x8,%ecx
  400c20:	83 f9 00             	cmp    $0x0,%ecx
  400c23:	40 0f 95 c6          	setne  %sil
  400c27:	40 88 b5 12 fe ff ff 	mov    %sil,-0x1ee(%rbp)
  400c2e:	8a 85 12 fe ff ff    	mov    -0x1ee(%rbp),%al
  400c34:	a8 01                	test   $0x1,%al
  400c36:	0f 85 05 00 00 00    	jne    400c41 <main+0x3d1>
  400c3c:	e9 05 00 00 00       	jmpq   400c46 <main+0x3d6>
  400c41:	e9 8c ff ff ff       	jmpq   400bd2 <main+0x362>
  400c46:	c7 85 8c fe ff ff 00 	movl   $0x0,-0x174(%rbp)
  400c4d:	00 00 00 
  400c50:	e9 d5 00 00 00       	jmpq   400d2a <main+0x4ba>
  400c55:	83 bd 8c fe ff ff 00 	cmpl   $0x0,-0x174(%rbp)
  400c5c:	0f 8e c3 00 00 00    	jle    400d25 <main+0x4b5>
  400c62:	31 ff                	xor    %edi,%edi
  400c64:	48 63 85 8c fe ff ff 	movslq -0x174(%rbp),%rax
  400c6b:	c6 84 05 50 fe ff ff 	movb   $0x0,-0x1b0(%rbp,%rax,1)
  400c72:	00 
  400c73:	8b 8d 84 fe ff ff    	mov    -0x17c(%rbp),%ecx
  400c79:	83 c1 01             	add    $0x1,%ecx
  400c7c:	89 8d 84 fe ff ff    	mov    %ecx,-0x17c(%rbp)
  400c82:	48 8d b5 60 ff ff ff 	lea    -0xa0(%rbp),%rsi
  400c89:	e8 d2 fa ff ff       	callq  400760 <getrusage@plt>
  400c8e:	48 8d bd 50 fe ff ff 	lea    -0x1b0(%rbp),%rdi
  400c95:	89 85 0c fe ff ff    	mov    %eax,-0x1f4(%rbp)
  400c9b:	e8 b0 03 00 00       	callq  401050 <check>
  400ca0:	31 ff                	xor    %edi,%edi
  400ca2:	34 ff                	xor    $0xff,%al
  400ca4:	24 01                	and    $0x1,%al
  400ca6:	88 85 4e fe ff ff    	mov    %al,-0x1b2(%rbp)
  400cac:	48 8d b5 d0 fe ff ff 	lea    -0x130(%rbp),%rsi
  400cb3:	e8 a8 fa ff ff       	callq  400760 <getrusage@plt>
  400cb8:	48 8d bd 60 ff ff ff 	lea    -0xa0(%rbp),%rdi
  400cbf:	48 8d b5 d0 fe ff ff 	lea    -0x130(%rbp),%rsi
  400cc6:	89 85 08 fe ff ff    	mov    %eax,-0x1f8(%rbp)
  400ccc:	e8 cf 02 00 00       	callq  400fa0 <calculate>
  400cd1:	f2 0f 58 85 c0 fe ff 	addsd  -0x140(%rbp),%xmm0
  400cd8:	ff 
  400cd9:	f2 0f 11 85 c0 fe ff 	movsd  %xmm0,-0x140(%rbp)
  400ce0:	ff 
  400ce1:	f6 85 4e fe ff ff 01 	testb  $0x1,-0x1b2(%rbp)
  400ce8:	0f 84 2d 00 00 00    	je     400d1b <main+0x4ab>
  400cee:	48 8d b5 50 fe ff ff 	lea    -0x1b0(%rbp),%rsi
  400cf5:	48 bf e5 13 40 00 00 	movabs $0x4013e5,%rdi
  400cfc:	00 00 00 
  400cff:	b0 00                	mov    $0x0,%al
  400d01:	e8 1a fa ff ff       	callq  400720 <printf@plt>
  400d06:	8b 8d 88 fe ff ff    	mov    -0x178(%rbp),%ecx
  400d0c:	83 c1 01             	add    $0x1,%ecx
  400d0f:	89 8d 88 fe ff ff    	mov    %ecx,-0x178(%rbp)
  400d15:	89 85 04 fe ff ff    	mov    %eax,-0x1fc(%rbp)
  400d1b:	c7 85 8c fe ff ff 00 	movl   $0x0,-0x174(%rbp)
  400d22:	00 00 00 
  400d25:	e9 00 00 00 00       	jmpq   400d2a <main+0x4ba>
  400d2a:	e9 00 00 00 00       	jmpq   400d2f <main+0x4bf>
  400d2f:	e9 4f fd ff ff       	jmpq   400a83 <main+0x213>
  400d34:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
  400d3b:	e8 b0 f9 ff ff       	callq  4006f0 <ferror@plt>
  400d40:	83 f8 00             	cmp    $0x0,%eax
  400d43:	0f 84 47 00 00 00    	je     400d90 <main+0x520>
  400d49:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
  400d50:	e8 bb f9 ff ff       	callq  400710 <fclose@plt>
  400d55:	48 8b b5 98 fe ff ff 	mov    -0x168(%rbp),%rsi
  400d5c:	48 bf e9 13 40 00 00 	movabs $0x4013e9,%rdi
  400d63:	00 00 00 
  400d66:	89 85 00 fe ff ff    	mov    %eax,-0x200(%rbp)
  400d6c:	b0 00                	mov    $0x0,%al
  400d6e:	e8 ad f9 ff ff       	callq  400720 <printf@plt>
  400d73:	89 85 fc fd ff ff    	mov    %eax,-0x204(%rbp)
  400d79:	e8 d2 04 00 00       	callq  401250 <unload>
  400d7e:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  400d85:	88 85 fb fd ff ff    	mov    %al,-0x205(%rbp)
  400d8b:	e9 f8 01 00 00       	jmpq   400f88 <main+0x718>
  400d90:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
  400d97:	e8 74 f9 ff ff       	callq  400710 <fclose@plt>
  400d9c:	31 ff                	xor    %edi,%edi
  400d9e:	48 8d b5 60 ff ff ff 	lea    -0xa0(%rbp),%rsi
  400da5:	89 85 f4 fd ff ff    	mov    %eax,-0x20c(%rbp)
  400dab:	e8 b0 f9 ff ff       	callq  400760 <getrusage@plt>
  400db0:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
  400db6:	e8 85 04 00 00       	callq  401240 <size>
  400dbb:	31 ff                	xor    %edi,%edi
  400dbd:	89 85 48 fe ff ff    	mov    %eax,-0x1b8(%rbp)
  400dc3:	48 8d b5 d0 fe ff ff 	lea    -0x130(%rbp),%rsi
  400dca:	e8 91 f9 ff ff       	callq  400760 <getrusage@plt>
  400dcf:	48 8d bd 60 ff ff ff 	lea    -0xa0(%rbp),%rdi
  400dd6:	48 8d b5 d0 fe ff ff 	lea    -0x130(%rbp),%rsi
  400ddd:	89 85 ec fd ff ff    	mov    %eax,-0x214(%rbp)
  400de3:	e8 b8 01 00 00       	callq  400fa0 <calculate>
  400de8:	31 ff                	xor    %edi,%edi
  400dea:	f2 0f 11 85 b8 fe ff 	movsd  %xmm0,-0x148(%rbp)
  400df1:	ff 
  400df2:	48 8d b5 60 ff ff ff 	lea    -0xa0(%rbp),%rsi
  400df9:	e8 62 f9 ff ff       	callq  400760 <getrusage@plt>
  400dfe:	89 85 e8 fd ff ff    	mov    %eax,-0x218(%rbp)
  400e04:	e8 47 04 00 00       	callq  401250 <unload>
  400e09:	31 ff                	xor    %edi,%edi
  400e0b:	24 01                	and    $0x1,%al
  400e0d:	88 85 47 fe ff ff    	mov    %al,-0x1b9(%rbp)
  400e13:	48 8d b5 d0 fe ff ff 	lea    -0x130(%rbp),%rsi
  400e1a:	e8 41 f9 ff ff       	callq  400760 <getrusage@plt>
  400e1f:	f6 85 47 fe ff ff 01 	testb  $0x1,-0x1b9(%rbp)
  400e26:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%rbp)
  400e2c:	0f 85 2a 00 00 00    	jne    400e5c <main+0x5ec>
  400e32:	48 8b b5 a8 fe ff ff 	mov    -0x158(%rbp),%rsi
  400e39:	48 bf fc 13 40 00 00 	movabs $0x4013fc,%rdi
  400e40:	00 00 00 
  400e43:	b0 00                	mov    $0x0,%al
  400e45:	e8 d6 f8 ff ff       	callq  400720 <printf@plt>
  400e4a:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  400e51:	89 85 e0 fd ff ff    	mov    %eax,-0x220(%rbp)
  400e57:	e9 2c 01 00 00       	jmpq   400f88 <main+0x718>
  400e5c:	48 8d bd 60 ff ff ff 	lea    -0xa0(%rbp),%rdi
  400e63:	48 8d b5 d0 fe ff ff 	lea    -0x130(%rbp),%rsi
  400e6a:	e8 31 01 00 00       	callq  400fa0 <calculate>
  400e6f:	f2 0f 11 85 b0 fe ff 	movsd  %xmm0,-0x150(%rbp)
  400e76:	ff 
  400e77:	8b b5 88 fe ff ff    	mov    -0x178(%rbp),%esi
  400e7d:	48 bf 12 14 40 00 00 	movabs $0x401412,%rdi
  400e84:	00 00 00 
  400e87:	b0 00                	mov    $0x0,%al
  400e89:	e8 92 f8 ff ff       	callq  400720 <printf@plt>
  400e8e:	8b b5 48 fe ff ff    	mov    -0x1b8(%rbp),%esi
  400e94:	48 bf 2d 14 40 00 00 	movabs $0x40142d,%rdi
  400e9b:	00 00 00 
  400e9e:	89 85 dc fd ff ff    	mov    %eax,-0x224(%rbp)
  400ea4:	b0 00                	mov    $0x0,%al
  400ea6:	e8 75 f8 ff ff       	callq  400720 <printf@plt>
  400eab:	8b b5 84 fe ff ff    	mov    -0x17c(%rbp),%esi
  400eb1:	48 bf 47 14 40 00 00 	movabs $0x401447,%rdi
  400eb8:	00 00 00 
  400ebb:	89 85 d8 fd ff ff    	mov    %eax,-0x228(%rbp)
  400ec1:	b0 00                	mov    $0x0,%al
  400ec3:	e8 58 f8 ff ff       	callq  400720 <printf@plt>
  400ec8:	f2 0f 10 85 c8 fe ff 	movsd  -0x138(%rbp),%xmm0
  400ecf:	ff 
  400ed0:	48 bf 61 14 40 00 00 	movabs $0x401461,%rdi
  400ed7:	00 00 00 
  400eda:	89 85 d4 fd ff ff    	mov    %eax,-0x22c(%rbp)
  400ee0:	b0 01                	mov    $0x1,%al
  400ee2:	e8 39 f8 ff ff       	callq  400720 <printf@plt>
  400ee7:	f2 0f 10 85 c0 fe ff 	movsd  -0x140(%rbp),%xmm0
  400eee:	ff 
  400eef:	48 bf 7d 14 40 00 00 	movabs $0x40147d,%rdi
  400ef6:	00 00 00 
  400ef9:	89 85 d0 fd ff ff    	mov    %eax,-0x230(%rbp)
  400eff:	b0 01                	mov    $0x1,%al
  400f01:	e8 1a f8 ff ff       	callq  400720 <printf@plt>
  400f06:	f2 0f 10 85 b8 fe ff 	movsd  -0x148(%rbp),%xmm0
  400f0d:	ff 
  400f0e:	48 bf 99 14 40 00 00 	movabs $0x401499,%rdi
  400f15:	00 00 00 
  400f18:	89 85 cc fd ff ff    	mov    %eax,-0x234(%rbp)
  400f1e:	b0 01                	mov    $0x1,%al
  400f20:	e8 fb f7 ff ff       	callq  400720 <printf@plt>
  400f25:	f2 0f 10 85 b0 fe ff 	movsd  -0x150(%rbp),%xmm0
  400f2c:	ff 
  400f2d:	48 bf b5 14 40 00 00 	movabs $0x4014b5,%rdi
  400f34:	00 00 00 
  400f37:	89 85 c8 fd ff ff    	mov    %eax,-0x238(%rbp)
  400f3d:	b0 01                	mov    $0x1,%al
  400f3f:	e8 dc f7 ff ff       	callq  400720 <printf@plt>
  400f44:	f2 0f 10 85 c8 fe ff 	movsd  -0x138(%rbp),%xmm0
  400f4b:	ff 
  400f4c:	f2 0f 58 85 c0 fe ff 	addsd  -0x140(%rbp),%xmm0
  400f53:	ff 
  400f54:	f2 0f 58 85 b8 fe ff 	addsd  -0x148(%rbp),%xmm0
  400f5b:	ff 
  400f5c:	f2 0f 58 85 b0 fe ff 	addsd  -0x150(%rbp),%xmm0
  400f63:	ff 
  400f64:	48 bf d1 14 40 00 00 	movabs $0x4014d1,%rdi
  400f6b:	00 00 00 
  400f6e:	89 85 c4 fd ff ff    	mov    %eax,-0x23c(%rbp)
  400f74:	b0 01                	mov    $0x1,%al
  400f76:	e8 a5 f7 ff ff       	callq  400720 <printf@plt>
  400f7b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  400f82:	89 85 c0 fd ff ff    	mov    %eax,-0x240(%rbp)
  400f88:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400f8b:	48 81 c4 40 02 00 00 	add    $0x240,%rsp
  400f92:	5d                   	pop    %rbp
  400f93:	c3                   	retq   
  400f94:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400f9b:	00 00 00 
  400f9e:	66 90                	xchg   %ax,%ax

0000000000400fa0 <calculate>:
  400fa0:	55                   	push   %rbp
  400fa1:	48 89 e5             	mov    %rsp,%rbp
  400fa4:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
  400fa8:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  400fac:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
  400fb1:	0f 84 0b 00 00 00    	je     400fc2 <calculate+0x22>
  400fb7:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  400fbc:	0f 85 0d 00 00 00    	jne    400fcf <calculate+0x2f>
  400fc2:	0f 57 c0             	xorps  %xmm0,%xmm0
  400fc5:	f2 0f 11 45 f8       	movsd  %xmm0,-0x8(%rbp)
  400fca:	e9 6d 00 00 00       	jmpq   40103c <calculate+0x9c>
  400fcf:	f2 0f 10 05 91 03 00 	movsd  0x391(%rip),%xmm0        # 401368 <_IO_stdin_used+0x8>
  400fd6:	00 
  400fd7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  400fdb:	48 69 00 40 42 0f 00 	imul   $0xf4240,(%rax),%rax
  400fe2:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  400fe6:	48 03 41 08          	add    0x8(%rcx),%rax
  400fea:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  400fee:	48 69 09 40 42 0f 00 	imul   $0xf4240,(%rcx),%rcx
  400ff5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  400ff9:	48 03 4a 08          	add    0x8(%rdx),%rcx
  400ffd:	48 29 c8             	sub    %rcx,%rax
  401000:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  401004:	48 69 49 10 40 42 0f 	imul   $0xf4240,0x10(%rcx),%rcx
  40100b:	00 
  40100c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  401010:	48 03 4a 18          	add    0x18(%rdx),%rcx
  401014:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  401018:	48 69 52 10 40 42 0f 	imul   $0xf4240,0x10(%rdx),%rdx
  40101f:	00 
  401020:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  401024:	48 03 56 18          	add    0x18(%rsi),%rdx
  401028:	48 29 d1             	sub    %rdx,%rcx
  40102b:	48 01 c8             	add    %rcx,%rax
  40102e:	f2 48 0f 2a c8       	cvtsi2sd %rax,%xmm1
  401033:	f2 0f 5e c8          	divsd  %xmm0,%xmm1
  401037:	f2 0f 11 4d f8       	movsd  %xmm1,-0x8(%rbp)
  40103c:	f2 0f 10 45 f8       	movsd  -0x8(%rbp),%xmm0
  401041:	5d                   	pop    %rbp
  401042:	c3                   	retq   
  401043:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40104a:	00 00 00 
  40104d:	0f 1f 00             	nopl   (%rax)

0000000000401050 <check>:
  401050:	55                   	push   %rbp
  401051:	48 89 e5             	mov    %rsp,%rbp
  401054:	48 83 ec 20          	sub    $0x20,%rsp
  401058:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
  40105c:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
  401060:	e8 6b 00 00 00       	callq  4010d0 <hash>
  401065:	89 45 ec             	mov    %eax,-0x14(%rbp)
  401068:	8b 45 ec             	mov    -0x14(%rbp),%eax
  40106b:	89 c7                	mov    %eax,%edi
  40106d:	48 8b 3c fd b0 20 60 	mov    0x6020b0(,%rdi,8),%rdi
  401074:	00 
  401075:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
  401079:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  40107e:	0f 84 30 00 00 00    	je     4010b4 <check+0x64>
  401084:	48 8b 7d e0          	mov    -0x20(%rbp),%rdi
  401088:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  40108c:	e8 3f f6 ff ff       	callq  4006d0 <strcasecmp@plt>
  401091:	83 f8 00             	cmp    $0x0,%eax
  401094:	0f 85 09 00 00 00    	jne    4010a3 <check+0x53>
  40109a:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
  40109e:	e9 15 00 00 00       	jmpq   4010b8 <check+0x68>
  4010a3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  4010a7:	48 8b 40 30          	mov    0x30(%rax),%rax
  4010ab:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  4010af:	e9 c5 ff ff ff       	jmpq   401079 <check+0x29>
  4010b4:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
  4010b8:	8a 45 ff             	mov    -0x1(%rbp),%al
  4010bb:	24 01                	and    $0x1,%al
  4010bd:	0f b6 c0             	movzbl %al,%eax
  4010c0:	48 83 c4 20          	add    $0x20,%rsp
  4010c4:	5d                   	pop    %rbp
  4010c5:	c3                   	retq   
  4010c6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4010cd:	00 00 00 

00000000004010d0 <hash>:
  4010d0:	55                   	push   %rbp
  4010d1:	48 89 e5             	mov    %rsp,%rbp
  4010d4:	48 83 ec 10          	sub    $0x10,%rsp
  4010d8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  4010dc:	c7 45 f4 05 15 00 00 	movl   $0x1505,-0xc(%rbp)
  4010e3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4010e7:	48 89 c1             	mov    %rax,%rcx
  4010ea:	48 83 c1 01          	add    $0x1,%rcx
  4010ee:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
  4010f2:	0f be 38             	movsbl (%rax),%edi
  4010f5:	e8 36 f6 ff ff       	callq  400730 <tolower@plt>
  4010fa:	89 45 f0             	mov    %eax,-0x10(%rbp)
  4010fd:	83 f8 00             	cmp    $0x0,%eax
  401100:	0f 84 14 00 00 00    	je     40111a <hash+0x4a>
  401106:	8b 45 f4             	mov    -0xc(%rbp),%eax
  401109:	c1 e0 05             	shl    $0x5,%eax
  40110c:	03 45 f4             	add    -0xc(%rbp),%eax
  40110f:	03 45 f0             	add    -0x10(%rbp),%eax
  401112:	89 45 f4             	mov    %eax,-0xc(%rbp)
  401115:	e9 c9 ff ff ff       	jmpq   4010e3 <hash+0x13>
  40111a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  40111d:	31 d2                	xor    %edx,%edx
  40111f:	b9 80 38 01 00       	mov    $0x13880,%ecx
  401124:	f7 f1                	div    %ecx
  401126:	89 d0                	mov    %edx,%eax
  401128:	48 83 c4 10          	add    $0x10,%rsp
  40112c:	5d                   	pop    %rbp
  40112d:	c3                   	retq   
  40112e:	66 90                	xchg   %ax,%ax

0000000000401130 <load>:
  401130:	55                   	push   %rbp
  401131:	48 89 e5             	mov    %rsp,%rbp
  401134:	48 83 ec 30          	sub    $0x30,%rsp
  401138:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
  40113c:	c7 04 25 a0 20 60 00 	movl   $0x0,0x6020a0
  401143:	00 00 00 00 
  401147:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
  40114b:	48 be bb 13 40 00 00 	movabs $0x4013bb,%rsi
  401152:	00 00 00 
  401155:	e8 f6 f5 ff ff       	callq  400750 <fopen@plt>
  40115a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  40115e:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  401163:	0f 85 09 00 00 00    	jne    401172 <load+0x42>
  401169:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
  40116d:	e9 b2 00 00 00       	jmpq   401224 <load+0xf4>
  401172:	e9 00 00 00 00       	jmpq   401177 <load+0x47>
  401177:	bf 38 00 00 00       	mov    $0x38,%edi
  40117c:	e8 bf f5 ff ff       	callq  400740 <malloc@plt>
  401181:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  401185:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  40118a:	0f 85 09 00 00 00    	jne    401199 <load+0x69>
  401190:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
  401194:	e9 8b 00 00 00       	jmpq   401224 <load+0xf4>
  401199:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  40119d:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  4011a1:	48 be ee 14 40 00 00 	movabs $0x4014ee,%rsi
  4011a8:	00 00 00 
  4011ab:	b0 00                	mov    $0x0,%al
  4011ad:	e8 2e f5 ff ff       	callq  4006e0 <__isoc99_fscanf@plt>
  4011b2:	83 f8 ff             	cmp    $0xffffffff,%eax
  4011b5:	0f 85 11 00 00 00    	jne    4011cc <load+0x9c>
  4011bb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  4011bf:	48 89 c7             	mov    %rax,%rdi
  4011c2:	e8 f9 f4 ff ff       	callq  4006c0 <free@plt>
  4011c7:	e9 48 00 00 00       	jmpq   401214 <load+0xe4>
  4011cc:	48 8b 7d e0          	mov    -0x20(%rbp),%rdi
  4011d0:	e8 fb fe ff ff       	callq  4010d0 <hash>
  4011d5:	89 45 dc             	mov    %eax,-0x24(%rbp)
  4011d8:	8b 45 dc             	mov    -0x24(%rbp),%eax
  4011db:	89 c7                	mov    %eax,%edi
  4011dd:	48 8b 3c fd b0 20 60 	mov    0x6020b0(,%rdi,8),%rdi
  4011e4:	00 
  4011e5:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  4011e9:	48 89 79 30          	mov    %rdi,0x30(%rcx)
  4011ed:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  4011f1:	8b 45 dc             	mov    -0x24(%rbp),%eax
  4011f4:	89 c7                	mov    %eax,%edi
  4011f6:	48 89 0c fd b0 20 60 	mov    %rcx,0x6020b0(,%rdi,8)
  4011fd:	00 
  4011fe:	8b 04 25 a0 20 60 00 	mov    0x6020a0,%eax
  401205:	83 c0 01             	add    $0x1,%eax
  401208:	89 04 25 a0 20 60 00 	mov    %eax,0x6020a0
  40120f:	e9 63 ff ff ff       	jmpq   401177 <load+0x47>
  401214:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  401218:	e8 f3 f4 ff ff       	callq  400710 <fclose@plt>
  40121d:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
  401221:	89 45 d8             	mov    %eax,-0x28(%rbp)
  401224:	8a 45 ff             	mov    -0x1(%rbp),%al
  401227:	24 01                	and    $0x1,%al
  401229:	0f b6 c0             	movzbl %al,%eax
  40122c:	48 83 c4 30          	add    $0x30,%rsp
  401230:	5d                   	pop    %rbp
  401231:	c3                   	retq   
  401232:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  401239:	00 00 00 
  40123c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401240 <size>:
  401240:	55                   	push   %rbp
  401241:	48 89 e5             	mov    %rsp,%rbp
  401244:	8b 04 25 a0 20 60 00 	mov    0x6020a0,%eax
  40124b:	5d                   	pop    %rbp
  40124c:	c3                   	retq   
  40124d:	0f 1f 00             	nopl   (%rax)

0000000000401250 <unload>:
  401250:	55                   	push   %rbp
  401251:	48 89 e5             	mov    %rsp,%rbp
  401254:	48 83 ec 10          	sub    $0x10,%rsp
  401258:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  40125f:	81 7d fc 80 38 01 00 	cmpl   $0x13880,-0x4(%rbp)
  401266:	0f 8d 1f 00 00 00    	jge    40128b <unload+0x3b>
  40126c:	48 63 45 fc          	movslq -0x4(%rbp),%rax
  401270:	48 8b 3c c5 b0 20 60 	mov    0x6020b0(,%rax,8),%rdi
  401277:	00 
  401278:	e8 23 00 00 00       	callq  4012a0 <vacate_list>
  40127d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  401280:	83 c0 01             	add    $0x1,%eax
  401283:	89 45 fc             	mov    %eax,-0x4(%rbp)
  401286:	e9 d4 ff ff ff       	jmpq   40125f <unload+0xf>
  40128b:	b0 01                	mov    $0x1,%al
  40128d:	24 01                	and    $0x1,%al
  40128f:	0f b6 c0             	movzbl %al,%eax
  401292:	48 83 c4 10          	add    $0x10,%rsp
  401296:	5d                   	pop    %rbp
  401297:	c3                   	retq   
  401298:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40129f:	00 

00000000004012a0 <vacate_list>:
  4012a0:	55                   	push   %rbp
  4012a1:	48 89 e5             	mov    %rsp,%rbp
  4012a4:	48 83 ec 10          	sub    $0x10,%rsp
  4012a8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  4012ac:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  4012b1:	0f 85 05 00 00 00    	jne    4012bc <vacate_list+0x1c>
  4012b7:	e9 19 00 00 00       	jmpq   4012d5 <vacate_list+0x35>
  4012bc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4012c0:	48 8b 78 30          	mov    0x30(%rax),%rdi
  4012c4:	e8 d7 ff ff ff       	callq  4012a0 <vacate_list>
  4012c9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4012cd:	48 89 c7             	mov    %rax,%rdi
  4012d0:	e8 eb f3 ff ff       	callq  4006c0 <free@plt>
  4012d5:	48 83 c4 10          	add    $0x10,%rsp
  4012d9:	5d                   	pop    %rbp
  4012da:	c3                   	retq   
  4012db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004012e0 <__libc_csu_init>:
  4012e0:	41 57                	push   %r15
  4012e2:	41 56                	push   %r14
  4012e4:	49 89 d7             	mov    %rdx,%r15
  4012e7:	41 55                	push   %r13
  4012e9:	41 54                	push   %r12
  4012eb:	4c 8d 25 0e 0b 20 00 	lea    0x200b0e(%rip),%r12        # 601e00 <__frame_dummy_init_array_entry>
  4012f2:	55                   	push   %rbp
  4012f3:	48 8d 2d 0e 0b 20 00 	lea    0x200b0e(%rip),%rbp        # 601e08 <__do_global_dtors_aux_fini_array_entry>
  4012fa:	53                   	push   %rbx
  4012fb:	41 89 fd             	mov    %edi,%r13d
  4012fe:	49 89 f6             	mov    %rsi,%r14
  401301:	4c 29 e5             	sub    %r12,%rbp
  401304:	48 83 ec 08          	sub    $0x8,%rsp
  401308:	48 c1 fd 03          	sar    $0x3,%rbp
  40130c:	e8 7f f3 ff ff       	callq  400690 <_init>
  401311:	48 85 ed             	test   %rbp,%rbp
  401314:	74 20                	je     401336 <__libc_csu_init+0x56>
  401316:	31 db                	xor    %ebx,%ebx
  401318:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40131f:	00 
  401320:	4c 89 fa             	mov    %r15,%rdx
  401323:	4c 89 f6             	mov    %r14,%rsi
  401326:	44 89 ef             	mov    %r13d,%edi
  401329:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40132d:	48 83 c3 01          	add    $0x1,%rbx
  401331:	48 39 dd             	cmp    %rbx,%rbp
  401334:	75 ea                	jne    401320 <__libc_csu_init+0x40>
  401336:	48 83 c4 08          	add    $0x8,%rsp
  40133a:	5b                   	pop    %rbx
  40133b:	5d                   	pop    %rbp
  40133c:	41 5c                	pop    %r12
  40133e:	41 5d                	pop    %r13
  401340:	41 5e                	pop    %r14
  401342:	41 5f                	pop    %r15
  401344:	c3                   	retq   
  401345:	90                   	nop
  401346:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40134d:	00 00 00 

0000000000401350 <__libc_csu_fini>:
  401350:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000401354 <_fini>:
  401354:	48 83 ec 08          	sub    $0x8,%rsp
  401358:	48 83 c4 08          	add    $0x8,%rsp
  40135c:	c3                   	retq   
