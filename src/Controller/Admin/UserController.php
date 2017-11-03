<?php

namespace App\Controller\Admin;

use App\Entity\User;
use App\Form\UserType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;

class UserController extends Controller
{
    /**
     * @Route("/settings/users", name="admin_settings_users")
     * @Method("GET")
     */
    public function indexAction()
    {
        $user = $this->getUser();

        $entityManager = $this->getDoctrine()->getManager();
        $users = $entityManager->getRepository(User::class)->findUsers($user->getCompanyID());
        return $this->render('admin/settings/users/index.html.twig', ['users' => $users]);
    }
}