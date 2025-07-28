#file=Codes/03_Generate_Bell_states.ipynb
file=Codes_Qalgos/Deutsch_algorithm.ipynb

#git rm --cached $file # <- only removes from git repo, 
                      #  not from file system
git rm $file
git commit -m "$file removed on `date`" 
