// Copyright 2013-2018 Workiva Inc.
//
// Licensed under the Boost Software License (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.boost.org/LICENSE_1_0.txt
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// This software or document includes material copied from or derived
// from JSON-Schema-Test-Suite (https://github.com/json-schema-org/JSON-Schema-Test-Suite),
// Copyright (c) 2012 Julian Berman, which is licensed under the following terms:
//
//     Copyright (c) 2012 Julian Berman
//
//     Permission is hereby granted, free of charge, to any person obtaining a copy
//     of this software and associated documentation files (the "Software"), to deal
//     in the Software without restriction, including without limitation the rights
//     to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//     copies of the Software, and to permit persons to whom the Software is
//     furnished to do so, subject to the following conditions:
//
//     The above copyright notice and this permission notice shall be included in
//     all copies or substantial portions of the Software.
//
//     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//     IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//     FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//     AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//     LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//     OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//     THE SOFTWARE.

library json_schema.test_validation;

import 'package:json_schema/json_schema.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';

final Logger _logger = Logger('test_validation');

void main([List<String> args]) {
  if (args?.isEmpty == true) {
    Logger.root.onRecord.listen((LogRecord r) => print('${r.loggerName} [${r.level}]:\t${r.message}'));
    Logger.root.level = Level.OFF;
  }

  ////////////////////////////////////////////////////////////////////////
  // Uncomment to see logging of exceptions
  // Logger.root.onRecord.listen((LogRecord r) =>
  //   print('${r.loggerName} [${r.level}]:\t${r.message}'));

  Logger.root.level = Level.OFF;

  group('Schema self validation', () {
    test('draft4', () {
      // Pull in the official schema, verify description and then ensure
      // that the schema satisfies the schema for schemas
      final url = 'http://json-schema.org/draft-04/schema#';
      JsonSchema.createSchemaFromUrl(url).then((schema) {
        expect(schema.schemaMap['description'], 'Core schema meta-schema');
        expect(schema.validate(schema.schemaMap), true);
      });
    });
    test('draft6', () {
      // Pull in the official schema, verify description and then ensure
      // that the schema satisfies the schema for schemas
      final url = 'http://json-schema.org/draft-06/schema#';
      JsonSchema.createSchemaFromUrl(url).then((schema) {
        expect(schema.schemaMap['description'], 'Core schema meta-schema');
        expect(schema.validate(schema.schemaMap), true);
      });
    });
    test('draft7', () {
      // Pull in the official schema, verify description and then ensure
      // that the schema satisfies the schema for schemas
      final url = 'http://json-schema.org/draft-07/schema#';
      JsonSchema.createSchemaFromUrl(url).then((schema) {
        expect(schema.schemaMap['description'], 'Core schema meta-schema');
        expect(schema.validate(schema.schemaMap), true);
      });
    });
  });
}