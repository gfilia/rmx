import os
import readline

fn main() {

	if os.args.len < 2 {
		usage()	
		exit(1)
	} else {
		println(os.args[1])
	}

	path := os.args[1]
	println('Selected path: ${path}')

	sure := readline.read_line('Are you sure you wand delete all file in this directory? [y,N] ')!
	if sure == 'y' {
		read_files_recursively(path)
	}
}

fn read_files_recursively(path string) {
	mut files := os.ls(path) or {
		println('Error while opening "${path}"!')
		exit(1)
	}

	for file in files {
		if os.is_dir(file) {
			read_files_recursively(path + '/' + file)
		}
		//println("     " + path + "/" + file)
		os.rm(path + '/' + file) or { 
			println(err) 
			}
	}

	println("${files.len} Files deleted")

}


fn usage() {
	println("Usage: rmx path")

}