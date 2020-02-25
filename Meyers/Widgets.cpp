#include "Widgets.h"

Widget & Widget::operator=(const Widget& rhs)
{
	Bitmap *pOrig = pb;
	pb = new Bitmap(*rhs.pb);
	delete pOrig;

	return *this;

}