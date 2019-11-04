build: clean
	make Report.pdf
	make pclean

Report.pdf: Report.tex user_guide.tex use_flow_dot.png
	pdflatex Report.tex

%_dot.png: %.dot
	dot $< -Tpng > $@

clean: pclean
	rm *.pdf -f

pclean:
	rm *.log -f
	rm *.aux -f
	rm *_dot.png -f


.PHONY: clean build
