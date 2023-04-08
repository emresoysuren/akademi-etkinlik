import 'package:akademi_etkinlik/pages/create/form/create_event_form.dart';
import 'package:akademi_etkinlik/pages/create/form/utils/form_code_generator.dart';

class FormReturn {
  final EventForm eventForm;
  final FormType formType;

  FormReturn(this.formType, this.eventForm);
}
