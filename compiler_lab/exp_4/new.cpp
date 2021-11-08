#include<bits/stdc++.h>
using namespace std;
int i=0,j=0, number_of_terminals = 0;
char pb[10][10];// It will store the production rules
char non_ter[10]; // It will store the non termination symbol
int number_of_production;
bool non_terminal(char);
void FIRST(vector<char>, char);
void FOLLOW(char);
vector<char> first_set; // for storing the first of terminal or non terminal
map<pair<int, int>, string> parsing_table; // for storing the predictive parser table
vector<char> terminals; // for strong the terminals symbols
vector<char> nt;// it storing the only one occurrence of non_terminal symbol
void pre_parser_table_generator();
void non_recursive_predictive_parser(string);
//int ni;


/*void find(char ch)
{
	int cnt=0;
	for(int i=0;i<number_of_production;i++)
	{
		int j=0;
		while(pb[i][j]!='\0')
		{
			if(pb[i][j]==ch)
			{
				cnt++;
				non_ter[number_of_production+cnt]=non_ter[i];
				pb[number_of_production+cnt]=pb[i].substr(1);
			}
			j++;
		}
	}
	number_of_production+=cnt;
}*/
int main()
{
    //NOTE: Epsilon production rule will be denoted by A->#
        cout<<"Enter the number of terminal symbols ";
        cin>>number_of_terminals;
		//ni=number_of_terminals;
        number_of_terminals++; // because for parsing table $ symbol will be extra terminating symbol
        terminals.resize(number_of_terminals);
        cout<<"Enter all terminals : ";
        for(int i=0; i<number_of_terminals-1; i++)
        {
            cin>>terminals[i];
        }
        terminals[number_of_terminals-1] = '$';
        printf("Enter the number of production rule:");
        scanf("%d",&number_of_production);
        printf("\nEnter the productions: ");
        for(int i=0; i<number_of_production; i++)
        {
                printf("\nProduction LHS :");
                cin>>non_ter[i];
                printf("\nProduction body :");
                printf("%c ->",non_ter[i]);
                cin>>pb[i];
                printf("\n");
        }
		/*for(int i=0;i<number_of_production;i++)
		{
			if(pb[i][0]=='#')
			{
				ni+=1;
				find(non_ter[i]);
			}
		}*/
        char c;
        char check = 'y';
        while(check!='n')
        {
            cout<<"Enter Symbol to find first ";
            cin>>c;
            FIRST(first_set,c);
            cout<<"{";
            for(int i = 0; i<first_set.size(); i++)
            {
                cout<<first_set[i]<<",";
            }
            cout<<"}\n";
            first_set.clear();
		}
	return 0;
}  
void FIRST(vector<char> v, char ch)
{
    vector<char> sub_first;
    if(!non_terminal(ch))
    {
        first_set.push_back(ch);
        return;
    }
    if(non_terminal(ch))
    {
        int pb_body_pointer = 0;
        for(int i = 0; i<number_of_production; i++)
        {
            if(ch == non_ter[i])
            {
                if(pb[i][0]=='#')
                {
                    first_set.push_back('#');
                }
                else
                {
                    int j = 0;
                    while(pb[i][j]!='\0')
                    {
                        int epsilon = 0;
                        FIRST(sub_first, pb[i][j]);
                        for(int a =0; a<sub_first.size(); a++)
                        {
                            first_set.push_back(sub_first[a]);
                            if(sub_first[a]=='#')
                            {
                                epsilon = 1;
                            }
                        }
                        if(!epsilon)
                        {
                            break;
                        }
                        j++;
                    }
                }
            }
        }
    }
} 

bool non_terminal(char ch)
{
    for(int i = 0; i<strlen(non_ter); i++)
    {
        if(ch==non_ter[i])
        {
            return true;
        }
    }
    return false;
}