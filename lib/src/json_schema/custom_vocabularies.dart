// Copyright 2013-2022 Workiva Inc.
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

import 'package:json_schema/json_schema.dart';

/// Use to register a custom vocabulary with the [JsonSchema] compiler.
///
class CustomVocabulary {
  CustomVocabulary(this.vocabulary, this.keywordImplementations);

  /// Name of the vocabulary.
  final Uri vocabulary;

  /// A map of the keywords and implementation for the keywords.
  final Map<String, CustomKeyword> keywordImplementations;
}

/// A class to contain the set of functions for setting and validating keywords in a custom vocabulary.
///
/// The two functions provided are used to process an attribute in a schema and then validate data.
///
/// The setter function takes the current JsonSchema node being processed and the data from the json.
/// The given function should validate and transform the data however is needed for the corresponding validation
/// function. If the data is bad a [FormatException] with a clear message should be thrown.
///
/// The validation function takes the output from the property setter and data from a JSON payload to be validated.
/// A [CustomValidationResult] should be returned to indicate the outcome of the validation.
class CustomKeyword {
  CustomKeyword(this.propertySetter, this.validator);

  /// Function used to set a property from the a schema.
  final Object Function(JsonSchema schema, Object value) propertySetter;

  /// Function used to validate a json value.
  final ValidationContext Function(ValidationContext context, Object schemaProperty, Object instanceData) validator;
}

/// [ValidationContext] is the public interface for an object keeping track of the current validation state.
/// A concrete instance is passed into the validation function an updated is return from the validation function.
abstract class ValidationContext {
  /// Use [addError] to add a new error message to the validation context.
  void addError(String message);

  /// Use [addWarning] to ad a new warning message to the validation context.
  void addWarning(String message);
}
