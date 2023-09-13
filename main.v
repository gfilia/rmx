import os
import readline

fn main() {

	println(os.args)

	path := readline.read_line('Please provide path: ')!
	println('Selected path: ${path}')


	sure := readline.read_line('Are you sure you wand delete all file in this directory? ')!

	if sure == 'y' {
		read_files_recursively(path)
	}
}

fn read_files_recursively(path string) {
	mut files := os.ls(path) or {
		println(err)
		exit(1)
	}

	for file in files {
		if os.is_dir(file) {
			read_files_recursively(path + '/' + file)
			//println("  " + file)
		  	//println(path + "/" + file)
		}
		//println("     " + path + "/" + file)
		//os.rm(path + '/' + file) or { println(err) }
	}

	println("${files.len} Files deleted")

}
