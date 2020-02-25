
typedef int data_t;

enum COLOR
{
	BLACK = 0,
	RED   = 1
};

struct Node
{
	Node();
	~Node();

	// ------------------------------------------------

	Node* left_;
	Node* right_;
	Node* parent_;
	data_t* data_;
	char color_;
};


class RedBlackTree
{
public:
	RedBlackTree();
	~RedBlackTree();

	// ------------------------------------------------

	void add_left();
	void add_right();

	// ------------------------------------------------

	void print_node();
	void write_dot_scrypt();
	void exec_scrypt();


	// ------------------------------------------------

private:
	Node* root;
};


typedef RedBlackTree RBT;

