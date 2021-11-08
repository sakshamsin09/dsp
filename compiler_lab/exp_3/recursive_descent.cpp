#include<bits/stdc++.h>
using namespace std;
char pb[10][10];// It will store the production rules
char p[10]; // It will store the non termination symbol
string str;
int n, ind=0, string_index =0;
void parser(int);
int first_occurence = 0;
bool non_terminal(char),flag=false;
int main()
{
        printf("Enter the number of production rule:");
        scanf("%d",&n);
        printf("\nEnter the production and production body: ");
        for(int i=0; i<n; i++)
        {
                printf("\nProduction:");
                cin>>p[i];
                printf("\nProduction body:");
                printf("%c ->", p[i]);
                cin>>pb[i];
                printf("\n");
        }
        int t;
        cout<<"Enter the number of test case: ";
        cin>>t;
        while(t--){

            cout<<"Enter the a string which going to match: ";
            cin>>str;
			//int ind=0;
			for(int i=0;i<n;i++)
			{
				if(p[i]=='S')
					ind=i;
			}
            parser(ind);
			//parser(0);
			if(string_index==str.size())
			{
				printf("Succesfully parsed \n");
			}
			else{
				printf("Not parsed\n");
			}
            first_occurence = 0;
            string_index = 0;
        }
        return 0;
}

void parser(int index)
{
	/*if(p[index]=='S' && flag)
	{
		flag = true;
		if(index==n-1)
		{
			return ;
		}
		else{
			index++;
		}
	}
	else
	{	*/
	if(index==ind && flag)
	{
		return;
	}
	/*else if(index==n && flag)
	{
		index=0;
	}*/
	else
	{
		flag=true;
    for(int j = 0; j<strlen(pb[index]); j++)
    {
        if(non_terminal(pb[index][j]))
        {
            parser(first_occurence);
        }
        else
        {
            if(pb[index][j]==str[string_index])
            {
                cout<<str[string_index]<<" Matched with "<<pb[index][j]<<"\n";
                string_index++;
            }
            else
            {
                cout<<str[string_index]<<" Not matched with "<<pb[index][j]<<"\n";
                cout<<"Backtracking.......!\n";
                string_index--;
				/*if(index+1 ==ind)
				{
					index++;
				}*/
                parser(index+1);
            }
        }
    }
	}
}
bool non_terminal(char ch)
{
    for(int i = 0; i<n; i++)
    {
        if(ch==p[i])
        {
            first_occurence = i;
            return true;
        }
    }
    return false;
}