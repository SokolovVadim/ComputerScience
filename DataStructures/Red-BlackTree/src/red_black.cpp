#include "../include/red_black.hpp"
#include <iostream>


// ------------------------------------------------

Node::Node():
	left_ (nullptr),
	right_(nullptr),
	parent_(nullptr),
	data_(nullptr),
	color_(BLACK)
{
	std::cout << "Construct Node with no parameters" << std::endl;
}

// ------------------------------------------------

Node::~Node()
{
	std::cout << "Destruct node" << std::endl;
}

// ------------------------------------------------

RedBlackTree::RedBlackTree()
{
	root = new Node;
}

// ------------------------------------------------

RedBlackTree::~RedBlackTree()
{
	delete root;
}

typedef RedBlackTree RBTree;

// ------------------------------------------------

void RBTree::print_node()
{
	std::cout << "printing node:" << std::endl;
	write_dot_scrypt();
	exec_scrypt();
}

// ------------------------------------------------

void RBTree::write_dot_scrypt()
{
	std::cout << "Writing dot scrypt ..." << std::endl;
}

// ------------------------------------------------

#define SHELLSCRYPT "\
/bin/bash scrypt.sh\
"

// ------------------------------------------------

void RBTree::exec_scrypt()
{
	std::cout << "Executing scrypt ..." << std::endl;
	int sys_ret = system(SHELLSCRYPT);
	if(sys_ret != 0)
	{
		perror("error while executing print scrypt");
		exit(EXIT_FAILURE);
	}
}

// ------------------------------------------------

void RBTree::add_right()
{
	std::cout << "Adding right" << std::endl;
}

// ------------------------------------------------

void RBTree::add_left()
{
	std::cout << "Adding left" << std::endl;
}
