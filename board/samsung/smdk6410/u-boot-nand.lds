/*
 * (C) Copyright 2002
 * Gary Jennejohn, DENX Software Engineering, <garyj@denx.de>
 *
 * (C) Copyright 2008
 * Guennadi Liakhovetki, DENX Software Engineering, <lg@denx.de>
 *
 * See file CREDITS for list of people who contributed to this
 * project.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
 * MA 02111-1307 USA
 */

OUTPUT_FORMAT("elf32-littlearm", "elf32-littlearm", "elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(_start)
SECTIONS
{
	. = 0x00000000;

	. = ALIGN(4);
	.text      :
	{
	  cpu/arm1176/start.o	(.text)
	  board/samsung/smdk6410/lowlevel_init.o (.text)
	  cpu/arm1176/s3c64xx/cpu_init.o	(.text)
	  cpu/arm1176/nand_cp.o (.text)
	  cpu/arm1176/s3c64xx/usbd_otg_hs.o (.text)
	  *(.text)
	}

	. = ALIGN(4);
	.rodata : { *(SORT_BY_ALIGNMENT(SORT_BY_NAME(.rodata*))) }

	. = ALIGN(4);
	.data : { *(.data) }

	. = ALIGN(4);
	.got : { *(.got) }

	__u_boot_cmd_start = .;
	.u_boot_cmd : { *(.u_boot_cmd) }
	__u_boot_cmd_end = .;

	. = ALIGN(4);
	.mmudata : { *(.mmudata) }

	. = ALIGN(4);
	__bss_start = .;
	.bss : { *(.bss) . = ALIGN(4); }
	_end = .;
}
