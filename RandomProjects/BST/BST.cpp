#include <iostream>
#include "BST.h"

using namespace std;

BST::BST()
{
    root = NULL;
}

BST::BST(const BST& other)
{
    copyHelper(root, other.root);
}

BST& BST::operator=(const BST& other)
{
    if (this == &other)
        return *this;
    clear();
    copyHelper(root, other.root);
    return *this;
}

BST::~BST()
{
    clear();
}

void BST::insert(const int& newData)
{
    insertHelper(root, newData);
}

void BST::clear()
{
    clearHelper(root);
}

void BST::showStructure() const
{
    if ( root == 0 )
       cout << "Empty tree" << endl;
    else
    {
       cout << endl;
       showHelper(root,1);
       cout << endl;
    }
}

void BST::writeKeys() const
{
    writeKeysHelper(root);
}

void BST::writeKeysLessThan(const int& searchKey) const
{
    writeKeysLessThanHelper(root, searchKey);
}

bool BST::retrieve(const int& searchKey, int& newDataItem)
{
    return retrieveHelper(root, searchKey, newDataItem);
}

bool BST::remove(const int& searchKey)
{
    if (isEmpty())
        return false;
    else
        return removeHelper(root, searchKey);
}

bool BST::isEmpty() const
{
    return (root == NULL);
}

int BST::getHeight() const
{
    return getHeightHelper(root);
}

int BST::getCount() const
{
    return getCountHelper(root);
}

BST::Node::Node(const int& nodeDataItem, Node* leftPtr, Node* rightPtr)
{
    data = nodeDataItem;
    left = leftPtr;
    right = rightPtr;
}

// ======================= Helper functions ===================== //
//


void BST::showHelper(Node* p, int level) const
{
     int j;   // Loop counter

     if ( p != 0 )
     {
        showHelper(p->right,level+1);         // Output right subtree
        for ( j = 0 ; j < level ; j++ )    // Tab over to level
            cout << "\t";
        cout << " " << p->data;   // Output key
        if ( ( p->left != 0 ) &&           // Output "connector"
             ( p->right != 0 ) )
           cout << "<";
        else if ( p->right != 0 )
           cout << "/";
        else if ( p->left != 0 )
           cout << "\\";
        cout << endl;
        showHelper(p->left,level+1);          // Output left subtree
    }
}

void BST::copyHelper(Node*& p , Node* src)
{
    if (src == NULL)
        return;
    {
        insertHelper(p, src->data);
        copyHelper(p->left, src->left);
        copyHelper(p->right, src->right);
    }
}

void BST::clearHelper(Node*& p)
{
    if (p == NULL)
        return;
    clearHelper(p->left);
    clearHelper(p->right);
    delete p;
    p = NULL;
}

void BST::insertHelper(Node*& p, const int& searchKey)
{
    if (p == NULL)
    {
        p = new Node(searchKey, NULL, NULL);
        return;
    }
    if (p->data > searchKey)
        insertHelper(p->left, searchKey);
    else if (p->data < searchKey)
        insertHelper(p->right, searchKey);
    else
        p->data = searchKey;
}

void BST::writeKeysHelper(Node* p) const
{
    // insert code later
}

void BST::writeKeysLessThanHelper(Node* p, const int& searchKey) const
{
    // insert code later
}

int BST::getCountHelper(Node* p) const
{
    return 0;   // insert code later
}

int BST::getHeightHelper(Node* p) const
{
    return 0;   // insert code later
}

bool BST::removeHelper(Node*& p, const int& searchKey)
{
    if (p == NULL)
        return false;
    else if (p->data > searchKey)
        return removeHelper(p->left, searchKey);
    else if (p->data < searchKey)
        return removeHelper(p->right, searchKey);
    else
    {
        if (p->left == NULL && p->right == NULL)
        {
            delete p;
            p = NULL;
            return true;
        }
        if (p->right == NULL)
        {
            Node* temp = p;
            p = p->left;
            delete temp;
            return true;
        }
        if (p->left == NULL)
        {
            Node* temp = p;
            p = p->right;
            delete temp;
            return true;
        }
        Node* temp = p->left;
        while (temp->right != NULL)
            temp =  temp->right;
        p->data = temp->data;
        return removeHelper(p->left, temp->data);
    }
    return false;
}

bool BST::retrieveHelper(Node* p, const int& searchKey, int& searchDataItem) const
{
    if (p == NULL)
        return false;
    if (p->data == searchKey)
    {
        searchDataItem = p->data;
        return true;
    }
    if (p->data > searchKey)
        return retrieveHelper(p->left, searchKey, searchDataItem);
    else if (p->data < searchKey)
        return retrieveHelper(p->right, searchKey, searchDataItem);
    return false;
}


