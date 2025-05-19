import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vurelo/app/app_colors.dart';

Widget genericInputField(
  String label,
  TextInputType keyboardType,
  void Function(String)? onChanged,
  BuildContext context, {
  void Function(Country)? onSelect,
  String currentCountryFlag = '🇨🇴',
  String currentCountryPhoneCode = '57',
}) =>
    keyboardType == TextInputType.number
        ? Container(
          decoration: BoxDecoration(
            border: Border.all(width: 0.16),
            borderRadius: BorderRadius.circular(40),
            color: AppColors.primary.withAlpha(16),
          ),
          child: Row(
            children: [
              MaterialButton(
                onPressed:
                    () => showCountryPicker(
                      context: context,
                      showPhoneCode: true,
                      moveAlongWithKeyboard: true,
                      countryListTheme: CountryListThemeData(
                        flagSize: 25,
                        backgroundColor: Colors.white,
                        textStyle: TextStyle(
                          fontSize: 16,
                          color: AppColors.grayDark,
                          fontWeight: FontWeight.w500,
                        ),

                        bottomSheetHeight: 500,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),

                        inputDecoration: InputDecoration(
                          labelText: 'Buscar por país o código',

                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.grayDark.withAlpha(80),
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                      onSelect: onSelect!,
                    ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                height: 52,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                ),

                elevation: 0.0,

                color: AppColors.grayLight,
                child: Row(
                  children: [
                    Text('$currentCountryFlag '),

                    Text('+$currentCountryPhoneCode  '),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),

              Expanded(
                child: CupertinoTextField(
                  placeholder: label,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(),

                  keyboardType: keyboardType,
                  inputFormatters:
                      keyboardType == TextInputType.number
                          ? [FilteringTextInputFormatter.digitsOnly]
                          : [],
                  onChanged: onChanged,
                ),
              ),
            ],
          ),
        )
        : CupertinoTextField(
          placeholder: label,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(width: 0.16),
            borderRadius: BorderRadius.circular(40),
          ),
          keyboardType: keyboardType,
          inputFormatters:
              keyboardType == TextInputType.number
                  ? [FilteringTextInputFormatter.digitsOnly]
                  : [],
          onChanged: onChanged,
        );
