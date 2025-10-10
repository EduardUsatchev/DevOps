apt install less file man-db nano tzdata net-tools vim man file -y
cd /tmp/
    2  ls
    3  ls -l
    4  cd /var/
    5  ls -l
    6  ls -ltr
    7  ls -ltrh
    8  ls --help
    9  ls --help | grep r
   10  echo 1 > .blabla
   11  ls -l
   12  ls -la
   13  cat .blabla
   14  cd /usr/local/bin/
   15  ls -la
   16  cd /bin
   17  ls -l
   18  ls -ltr
   19  ls ./cat
   20  ls ../cat
   21  ls ../
   22  pwd
   23  cd /usr/local/bin/
   24  ls -l ../
   25  ls -l ../../
   26  ls -l ../../../
   27  cd ../../../
   28  cd -
   29  cd ../../
   30  cd -
   31  history
   32  cd -
   33  cd
   34  pwd
   Alias   vim ~/.bashrc
   35  cd /home/
   36  ls
   37  useradd edi
   38  cd ~edi
   39  cd ~edi/
   40  ls /home/
   41  ll
   42  cd
   43  echo 1 > 1.txt
   44  ls -l
   45  mkdir experts1004
   46  cd experts1004/
   47  mkdir a/b/c/d
   48  mkdir -p a/b/c/d
   49  pwd
   50  cd a/b/c/d
   51  pwd
   52  cd -
   53  mkdir -p a/b/c/d
   54  ls a
   55  mkdir -p a/b/c/e
   56  touch 1.txt
   57  echo 1 > 1.txt
   58  cat 1.txt
   59  ls -la
   60  date
   61  ls -la
   62  date
   63  ls -la
   64  touch 1.txt
   65  ls -la
   66  rmdir a/b/c/d/
   67  echo 2 > a/b/c/e/1.txt
   68  rmdir a/b/c/e/
   69  rm a/b/c
   70  rm -r a/b/c
   71  AA="moshe"
   72  BB="david"
   73  cd /var/log/
   74  ls
   75  ls -l
   76  less bootstrap.log
   77  apt update
   78  apt list --upgradable
   79  less bootstrap.log
   80  apt install less
   81  less bootstrap.log
   82  echo $EDITOR
   83  less bootstrap.log
   84  head -5 bootstrap.log
   85  tail -5 bootstrap.log
   86  head -5 bootstrap.log | less
   87  history

   vim :
        shift g Down
        gg Up
        i = insert
        o = insert + newline
        a = insert + nextchar
        v = visualize + choose
            y = copy
            p = paste
            u = undo
        :!ping 8.8.8.8 / :!ls -ltr
        :vsp 1.txt
        :sp /var/log/dpkg.log
        :colorscheme
    view: The same as vim but readonly
    chmod u+x 1.txt
    chmod u=rwx,g=rw,o=r 1.txt
    chmod 777 1.txt ALL
    chmod 750 1.txt -rwxr-x--- USER = ALL Group = Read&Execute
    chmod -r
    cat /etc/passwd
    cat /etc/group
    apt install nginx
    cat /etc/apt/sources.lis