import '../../../export.dart';
import '../bloc/login_bloc.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
    required this.bloc,
  });

  final LoginBloc bloc;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
            key: bloc.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VSpace(Sizes.s30),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  _loginFormHeaderImage(),
                  const VSpace(Sizes.s8),
                  _loginFormWelcomText(context),
                  const VSpace(Sizes.s8),
                  Text(LocaleKeys.welcomeToAdminPortal.tr(),
                      textAlign: TextAlign.start,
                      style: AppCss.outfitRegular14.textColor(
                          Theme.of(context).colorScheme.onBackground))
                ]),
                const VSpace(Sizes.s40),
                _loginFormEmailField(context),
                _loginFormPasswordField(context),
                CommonButtonWidget(
                  title: LocaleKeys.login.tr(),
                  onTap: () {
                    // if (bloc.formKey.currentState!.validate()) {
                    context.read<LoginBloc>().add(LoginSubmitted());
                    // }
                  },
                ),
                const VSpace(Sizes.s30)
              ],
            )));
  }

  FittedBox _loginFormWelcomText(BuildContext context) {
    return FittedBox(
        child: Row(
      children: [
        Text(LocaleKeys.welcomeTo.tr(),
            style: AppCss.outfitMedium20
                .textColor(Theme.of(context).colorScheme.onSecondary)),
        Text(LocaleKeys.ers.tr(),
            style:
                AppCss.outfitBold20.textColor(Theme.of(context).primaryColor)),
      ],
    ));
  }

  Column _loginFormEmailField(BuildContext context) {
    return Column(
      children: [
        Text(LocaleKeys.email.tr(),
                style: AppCss.outfitRegular14
                    .textColor(Theme.of(context).colorScheme.onSecondary))
            .alignment(Alignment.centerLeft),
        const VSpace(Sizes.s10),
        InputTextField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: formValidation.validation(
            type: 'email',
            multiValidator: MultiValidator([]),
            isRequired: true,
            errorText: LocaleKeys.emailRequired.tr(),
          ),
          suffixIcon: const Icon(
            size: Sizes.s22,
            Icons.email_outlined,
          ),
          hintText: LocaleKeys.email.tr(),
          editingController: bloc.usernameController,
        ),
        const VSpace(Sizes.s20),
      ],
    );
  }

  Column _loginFormPasswordField(BuildContext context) {
    return Column(
      children: [
        Text(LocaleKeys.password.tr(),
                style: AppCss.outfitRegular14
                    .textColor(Theme.of(context).colorScheme.onSecondary))
            .alignment(Alignment.centerLeft),
        const VSpace(Sizes.s10),
        BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            final isPasswordVisible = state is PasswordVisibilityState
                ? state.isPasswordVisible
                : false;

            return Column(
              children: [
                InputTextField(
                  obscureText: !isPasswordVisible,
                  validator: formValidation.validation(
                    type: 'password',
                    multiValidator: MultiValidator([]),
                    isRequired: true,
                    errorText: LocaleKeys.passwordRequired.tr(),
                  ),
                  hintText: LocaleKeys.password.tr(),
                  editingController:
                      context.read<LoginBloc>().passwordController,
                  suffixIcon: IconButton(
                    icon: Icon(
                      size: Sizes.s22,
                      isPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onPressed: () {
                      bloc.add(TogglePasswordVisibility());
                    },
                  ),
                ),
                // Other form fields and buttons here
              ],
            );
          },
        ),
        const VSpace(Sizes.s40),
      ],
    );
  }

  SvgPicture _loginFormHeaderImage() {
    return SvgPicture.asset(
      AssetConstants.assetAppLogo,
      height: Sizes.s50,
    );
  }
}
