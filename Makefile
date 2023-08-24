all: example.ipynb

clean:
	rm example.ipynb

SNIPPETS := fab-config.md reserve-resources.md configure-resources.md offload-off.md ipv4-access-from-ipv6.md draw-topo-detailed-labels.md log-in.md delete-slice.md
example.ipynb: $(SNIPPETS) example.md
	pandoc --wrap=none \
                -i fab-config.md \
                example.md \
                reserve-resources.md configure-resources.md \
				offload-off.md ipv4-access-from-ipv6.md \
				draw-topo-detailed-labels.md log-in.md \
				delete-slice.md \
                -o example.ipynb  
