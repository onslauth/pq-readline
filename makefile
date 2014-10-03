include $(PQ_FACTORY)/factory.mk

pq_module_name := readline-6.3
pq_module_file := $(pq_module_name).tar.gz

build-stamp: stage-stamp
	$(MAKE) -C $(pq_module_name) && \
	$(MAKE) -C $(pq_module_name) install DESTDIR=$(stage_dir) && \
	touch $@

stage-stamp: configure-stamp

configure-stamp: patch-stamp
	(cd $(pq_module_name) && ./configure --prefix=$(part_dir)) && touch $@

patch-stamp: unpack-stamp
	touch $@

unpack-stamp:
	tar -xf $(source_dir)/$(pq_module_file) && touch $@
