#include <iostream>
#include "../include/red_black.hpp"

int main()
{
	RBT rbt;
	rbt.add_left();
	rbt.add_right();
	rbt.print_node();
	std::cout << "Hello!" << std::endl;
}
