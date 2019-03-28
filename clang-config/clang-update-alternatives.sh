#!/bin/bash

update-alternatives --install /usr/bin/clang clang /usr/bin/clang-7 100 \
    --slave /usr/bin/clang++                        clang++                     /usr/bin/clang++-7 \
    --slave /usr/bin/clang-apply-replacements       clang-apply-replacements    /usr/bin/clang-apply-replacements-7 \
    --slave /usr/bin/clang-change-namespace         clang-change-namespace      /usr/bin/clang-change-namespace-7 \
    --slave /usr/bin/clang-check                    clang-check                 /usr/bin/clang-check-7 \
    --slave /usr/bin/clang-cl                       clang-cl                    /usr/bin/clang-cl-7 \
    --slave /usr/bin/clang-cpp                      clang-cpp                   /usr/bin/clang-cpp-7 \
    --slave /usr/bin/clang-format                   clang-format                /usr/bin/clang-format-7 \
    --slave /usr/bin/clang-func-mapping             clang-func-mapping          /usr/bin/clang-func-mapping-7 \
    --slave /usr/bin/clang-tidy                     clang-tidy                  /usr/bin/clang-tidy-7 \
    --slave /usr/bin/clang-import-test              clang-import-test           /usr/bin/clang-import-test-7 \
    --slave /usr/bin/clang-query                    clang-query                 /usr/bin/clang-query-7 \
    --slave /usr/bin/clang-rename                   clang-rename                /usr/bin/clang-rename-7 \
    --slave /usr/bin/asan_symbolize                 asan_symbolize              /usr/bin/asan_symbolize-7 \
    --slave /usr/bin/clang-offload-bundler          clang-offload-bundler       /usr/bin/clang-offload-bundler-7 \
    --slave /usr/bin/clang-tidy-diff                clang-tidy-diff             /usr/bin/clang-tidy-diff-7.py \
    --slave /usr/bin/clang-reorder-fields           clang-reorder-fields        /usr/bin/clang-reorder-fields-7 \
    --slave /usr/bin/clangd                         clangd                      /usr/bin/clangd-7 \
    --slave /usr/bin/clang-format-diff              clang-format-diff           /usr/bin/clang-format-diff-7 \
    --slave /usr/bin/clang-include-fixer            clang-include-fixer         /usr/bin/clang-include-fixer-7 \
    --slave /usr/bin/clang-refactor                 clang-refactor              /usr/bin/clang-refactor-7
