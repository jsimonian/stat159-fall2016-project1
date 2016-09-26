MAIN = paper # Main directory name
SUB = sections # Subsection directory name
TITLE = paper # Output file name

.PHONY: all clean

all: $(MAIN).md $(MAIN).html

$(TITLE).md: $(MAIN)/$(SUB)/*
	cat $^ > $(MAIN)/$@

$(TITLE).html: $(TITLE).md
	pandoc $(MAIN)/$< -s -o $(MAIN)/$@

clean:
	cd $(MAIN); rm $(TITLE).md; rm $(TITLE).html
