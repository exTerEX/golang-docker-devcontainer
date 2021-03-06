# Copyright 2021 Andreas Sagen
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM golang:1.16.5-buster AS build

FROM exterex/base-dev

COPY --from=build /usr/local /usr/local

RUN sudo ln -s /usr/local/go/bin/go /usr/local/bin/go

ENV DEBIAN_FRONTEND noninteractive

RUN go get golang.org/x/tools/gopls@latest \
    && go install github.com/go-delve/delve/cmd/dlv@latest; \
    go version

ENV DEBIAN_FRONTEND dialog

CMD [ "bash" ]
