echo "Adding " ${PREFIX}/bin/python " to each python script"

for file in ${PREFIX}/bin/ccmc/examples/python/*.py; do sed -i '' '1i\
#!'${PREFIX}'/bin/python \
' $file; done

echo "Making python scripts executable... "
chmod a+x ${PREFIX}/bin/ccmc/examples/python/*.py

#add pip install plotly?