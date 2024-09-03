 1689  cd DevOpsCourse
 1690  ll
 1691  mkdir test_repo
 1692  cd test_repo
 1693  git init
 1694  echo 1 > 1.txt
 1695  ll
 1696  git status
 1697  git add .
 1698  git status
 1699  git config --global user.name moshe
 1700  git config --global user.email moshe
 1701  git config --global user.email moshe@moshe.com
 1702  git commit -am "init commit"
 1703  git log
 1704  git commit --help
 1705  git log
 1706  git remote add origin https://github.com/EduardUsatchev/test_repo.git
 1707  git branch -M main
 1708  git push -u origin main
 1709  echo 1 > 2.txt
 1710  git status
 1711  git commit -am "2.txt file"
 1712  git add .
 1713  git commit -am "2.txt file"
 1714  git push -u origin main
 1715  git log
 1716  git tree
 1717  git --help
 1718  git ls-tree
 1719  git ls-tree -d
 1720  git -full-tree
 1721  git log --graph --oneline --all
 1722  git log --graph --all
 1723  git checkout -b side_test
 1724  git log --graph --all
 1725  git switch main
 1726  git switch side_test
 1727  ls
 1728  echo 3 > 3.txt
 1729  git commit -am "3rd commit""
 1730  git commit -am "3rd commit"
 1731  git add ,
 1732  git add .
 1733  git commit -am "3rd commit"
 1734  git switch main
 1735  ls
 1736  git switch side_test
 1737  ls
 1738  git status
 1739  git switch main
 1740  git status
 1741  cd ..
 1742  mkdir ex1
 1743  cd ex1
 1744  git init
 1745  echo 1 > 1.txt
 1746  git add .
 1747  git commit -am "init commit"
 1748  echo 2 > 2.txt
 1749  git add .
 1750  git commit -am "2nd commit"
 1751  git checkout -b branch-a
 1752  echo 3 > 3.txt
 1753  git add .
 1754  git commit -am "3rd commit"
 1755  echo 4 > 4.txt
 1756  git add .
 1757  git commit -am "4th commit"
 1758  git checkout master
 1759  git checkout main
 1760  echo 5 > 5.txt
 1761  git add .
 1762  git commit -am "5th commit"
 1763  exho
 1764  echo 6 > 6.txt
 1765  git commit -am "6th commit"
 1766  git add .
 1767  git commit -am "6th commit"
 1768  git commit -b branch-a
 1769  git commit -b branch-b
 1770  git checkout -b branch-b
 1771  echo 7 > 7.txt
 1772  git add .
 1773  git commit -am "7th commit"
 1774  echo 8 > 8.txt
 1775  git add .
 1776  git commit -am "8th commit"
 1777  git checkout main
 1778  git log --graph --oneline --all
 1779  git add .
 1780  git commit -am "9th commit"
 1781  git status
 1782  ls
 1783  echo 9 > 9.txt
 1784  git add .
 1785  git commit -am "9th commit"
 1786  git log --graph --oneline --all
 1787  cd ..
 1788  mkdir merge-conflict
 1789  git init
 1790  rm -rf .git
 1791  cd merge-conflict
 1792  git init
 1793  echo 1 > 1.txt
 1794  git commit -am "init commit"
 1795  git add .
 1796  git commit -am "init commit"
 1797  git checkout -b my-branch
 1798  echo 2 > 2.txt
 1799  git commit -am "2nd commit"
 1800  git add .
 1801  git commit -am "2nd commit"
 1802  git merge main -m "merge"
 1803  ls
 1804  git checkout main
 1805  ks
 1806  ls
 1807  git checkout my-branch
 1808  ls
 1809  git checkout main
 1810  ls
 1811  git checkout my-branch
 1812  git status
 1813  git checkout main
 1814  git merge my-branch -m "merge"
 1815  ls
 1816  git checkout -b ff
 1817  echo 5 > 2.txt
 1818  git add .
 1819  git commit -am "3rd commit"
 1820  git checkout main
 1821  ls
 1822  echo 14 > 14.txt
 1823  git add .
 1824  git commit -am "14th commit"
 1825  git checkout ff
 1826  git merge main -m "merge"
 1827  git checkout master
 1828  git checkout main
 1829  echo 10 > 2.txt
 1830  git add .
 1831  git commit -am "5th commit"
 1832  git checkout ff
 1833  git merge main -m "merge"