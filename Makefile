all: example.ipynb

clean:
	rm example.ipynb

example.ipynb: fab-config.md reserve-resources.md configure-resources.md draw-topo-detailed-labels.md delete-slice.md
	pandoc --embed-resources --standalone --wrap=none \
                -i fab-config.md \
                example.md \
                reserve-resources.md configure-resources.md \
				draw-topo-detailed-labels.md \
				delete-slice.md \
                -o example.ipynb  
